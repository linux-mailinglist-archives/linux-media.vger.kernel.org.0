Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C66043559E3
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 19:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346742AbhDFRBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 13:01:47 -0400
Received: from sender4-of-o53.zoho.com ([136.143.188.53]:21323 "EHLO
        sender4-of-o53.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240167AbhDFRBn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 13:01:43 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617728479; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=XbFTVgU/xkJOzdHuqgDEfVUKwb5uKRbf1QiGuhisMr+pcTkAM75lHqf6Idl00p1tfflXkQ21lIS9/qnyIxDPeF8oW83IAkk6q8ndSwGRi/wPX4nq0Ftv1RSjbPpPjE9fcvg9+zbDMLlK8sgioYCM6sgWGnDH+pGgKTiuzIYG2mk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1617728479; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=UN7j970QECBU1lJ+nppRUAXZpJ0cNzt7rfhTuQktpoc=; 
        b=DVKYrXOr2E7DnAZBdyt80pGeNMfEtFFqI8EqjqQP/E6MBDNRA4S8X/D0keSK0HCPxfoF/Cel6dwwkNuXBB+BNUnvCVk87dV0ZmjjEpc9uNWV66l+K2u9NYMCPx9bEeVDPOJvqQVUgOmwxRW9tQs8Q3m4uf/76lFBVldyQ8k8+Ic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=anirudhrb.com;
        spf=pass  smtp.mailfrom=mail@anirudhrb.com;
        dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617728479;
        s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
        bh=UN7j970QECBU1lJ+nppRUAXZpJ0cNzt7rfhTuQktpoc=;
        b=Q9xf4HVV69XPi9taG4ewFUjNYavO0qC/IXlKJJYHOpPw80mUjWAtgfBADALbS0WJ
        R+tewmYemTArqemBuSU/ogER6Ut328o+QagBaqanOpYhEDrvQIBKFiPGWDHortcUBYs
        +UpbQ7KFL9bhDWQ8O9WhcXP1yKuHGLxLAWT84nzU=
Received: from anirudhrb.com (106.51.110.82 [106.51.110.82]) by mx.zohomail.com
        with SMTPS id 1617728465453354.6554727774635; Tue, 6 Apr 2021 10:01:05 -0700 (PDT)
Date:   Tue, 6 Apr 2021 22:30:59 +0530
From:   Anirudh Rayabharam <mail@anirudhrb.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        gregkh@linuxfoundation.org,
        syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: pvrusb2: fix warning in pvr2_i2c_core_done
Message-ID: <YGyTyz4XOuqO8Fd0@anirudhrb.com>
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

Ack, will fix these typos in v2.

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

Then we might run into the same warning again. pvr2_hdw_disconnect()
calls pvr2_hdw_remove_usb_stuff() which calls v4l2_device_disconnect().
Perhaps there we should call v4l2_device_unregister() instead?

> 
> Can you test that with syzbot?

Will do.

Thanks!

	- Anirudh.

> 
> Regards,
> 
> 	Hans
> 
> > -	pvr2_hdw_remove_usb_stuff(hdw);
> > +	pvr2_hdw_disconnect(hdw);
> >  	mutex_lock(&pvr2_unit_mtx);
> >  	do {
> >  		if ((hdw->unit_number >= 0) &&
> > @@ -2705,6 +2703,7 @@ void pvr2_hdw_disconnect(struct pvr2_hdw *hdw)
> >  {
> >  	pvr2_trace(PVR2_TRACE_INIT,"pvr2_hdw_disconnect(hdw=%p)",hdw);
> >  	LOCK_TAKE(hdw->big_lock);
> > +	pvr2_i2c_core_done(hdw);
> >  	LOCK_TAKE(hdw->ctl_lock);
> >  	pvr2_hdw_remove_usb_stuff(hdw);
> >  	LOCK_GIVE(hdw->ctl_lock);
> > 
> 
