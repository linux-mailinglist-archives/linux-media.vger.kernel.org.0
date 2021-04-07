Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4FF357217
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 18:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344145AbhDGQZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 12:25:57 -0400
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21376 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232387AbhDGQZ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 12:25:57 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617812736; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=C1h8uhyNkzrQ0E3qhcUIcbCvP4jGaDYVxarQb6cb5xxXZe5YaCpuSbLEQ9Y3WlPLUFO59oCYUJqs0rionf9qiW1SSwWsUSYsL5SSWsOuEtWOSukPS3orOqyui+8BpbFfut2gTv82sP/SYdgwUDbQt9mil0McnjckKjPZKxqisRo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1617812736; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=9rCgtNOMHsocXCv8CU0q2BcbGtHqxN61YcdO1kdtR64=; 
        b=f2SJ4z6yKavf+PN10HKCw1vf6mf2UlUl/sT1kJRNb8x052DF3t8V5ceKkg0GWM2N9AhatgIBHNdw4kaB57dl98bu0IvO8pmIBqULgTittuarWJjBaxdoK8PGp5yw+NhrtCwYDdw3zW0aMPyd0sWW4D0HhKOS8bq7uKOqvJ4DrbY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=anirudhrb.com;
        spf=pass  smtp.mailfrom=mail@anirudhrb.com;
        dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617812736;
        s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
        bh=9rCgtNOMHsocXCv8CU0q2BcbGtHqxN61YcdO1kdtR64=;
        b=YWv0oXbVsCkumBcNMtRlcp2a9bcPczKg31OFSsy0uJXcwSA5zqmHujMprRQldP51
        135sXGb8LsJg5nuskMTlEn/X2dfpJdln0xpKw6xPcY8/JspyM5jS/PGAQ2TKXFaP4LD
        vD2AeGuDZ/WznnS4uvFET5ps593Qy13B2VGjVceI=
Received: from anirudhrb.com (49.207.63.67 [49.207.63.67]) by mx.zohomail.com
        with SMTPS id 161781273293210.498895456132573; Wed, 7 Apr 2021 09:25:32 -0700 (PDT)
Date:   Wed, 7 Apr 2021 21:55:25 +0530
From:   Anirudh Rayabharam <mail@anirudhrb.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        gregkh@linuxfoundation.org,
        syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: pvrusb2: fix warning in pvr2_i2c_core_done
Message-ID: <YG3c9eWJvHtnfXsf@anirudhrb.com>
References: <20210401123338.3937-1-mail@anirudhrb.com>
 <b81e4612-dde3-d6e5-e647-b61c7c3501da@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b81e4612-dde3-d6e5-e647-b61c7c3501da@xs4all.nl>
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 06, 2021 at 11:38:25AM +0200, Hans Verkuil wrote:
> On 01/04/2021 14:33, Anirudh Rayabharam wrote:
> > syzbot has reported the following warning in pvr2_i2c_done:
> > 
> > 	sysfs group 'power' not found for kobject '1-0043'
> > 
> > When the device is disconnected (pvr_hdw_disconnect), the i2c adapter is
> > not unregistered along with the USB and vl42 teardown. As part of the
> 
> vl42 -> v4l2
> 
> > USB device disconnect, the sysfs files of the subdevices are also
> > deleted. So, by the time pvr_i2c_core_done is called by
> > pvr_context_destroy, the sysfs files have been deleted.
> > 
> > To fix this, unregister the i2c adapter too in pvr_hdw_disconnect. Make
> > the device deregistration code shared by calling pvr_hdw_disconnect from
> > pvr2_hdw_destory.
> 
> destory -> destroy
> 
> > 
> > Reported-and-tested-by: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com
> > Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> > ---
> >  drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > index f4a727918e35..791227787ff5 100644
> > --- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > +++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
> > @@ -2676,9 +2676,7 @@ void pvr2_hdw_destroy(struct pvr2_hdw *hdw)
> >  		pvr2_stream_destroy(hdw->vid_stream);
> >  		hdw->vid_stream = NULL;
> >  	}
> > -	pvr2_i2c_core_done(hdw);
> > -	v4l2_device_unregister(&hdw->v4l2_dev);
> 
> I think this should still remain since pvr2_hdw_disconnect() doesn't call
> v4l2_device_unregister().
> 
> Can you test that with syzbot?

Sent v2 with this change. Tested it with syzbot and didn't find any
problems.

Thanks.

	- Anirudh.
