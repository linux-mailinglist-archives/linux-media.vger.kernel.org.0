Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFE63ECEEA
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 09:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbhHPHCI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 03:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233695AbhHPHCH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 03:02:07 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92F1C061764
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 00:01:36 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id gr13so812672ejb.6
        for <linux-media@vger.kernel.org>; Mon, 16 Aug 2021 00:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=atZSkhJ4AKxZwYu5ftachxHVd6K9Xz70HfrbUnQgBiY=;
        b=tlUS/1xl2gL4ciLFHGnJDWLkBT8NGR2fr06JmpT1EHeAVma6h4hmM+MGMryvp74Hgm
         KQG1KZpYT9mKwxBLUgra8Dukq8SdNWfmX2i6HRgU2fBFtAl8Zu2denB5zIRrlW/3q66D
         G4mihTNK/3Mz2IJxRIntQGwJTUo0Gfwb4HWDw9STMsm2RrjnQqWl+U+wc4YFGd6s7FV4
         GeQwH6mLxsdtOmXTsjg+zaNAmnL6g6dMLf3vzQIu3Ne5VLxOpW2mtoaDSU5LQq9T5N0t
         xkt0NrYlhVkpekwA4WDEHk0Ibu3+Q601X6rLOQUc0mvp9H0qRhPRJIIE84a1ElYAYa2Y
         5LKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=atZSkhJ4AKxZwYu5ftachxHVd6K9Xz70HfrbUnQgBiY=;
        b=LHTuhCvxcoJCaLB/HLKZReBGDYWs6Yze1meiEKwubdVqsav3N0G0EvzrGmDgY9qA7F
         E+PnF9VSiRiLGzPW0reNM3hiGmdhZCntnDzpxVazg1s2TlFlagmc6yC/URgjn+6nGKQJ
         tVexdr7ecrmtgF2avfPVKpRI7nzgF6RWh1TZYM44DFgIjI/NlPOk4A3RJKANHAdzS0hH
         NLmvKeYEdfM9NY6Sw2cHk2Xa+KaBo6K8TWaEskNWS9OAYs+OnBtv2ssL+RErZvUVxBEY
         +F/5vJCaFYWzAti1GV7cTXy1YVKdYDlrOPuTOlIAM078DXXEwkyDI7PA2OVHNYWwgXNj
         lzuw==
X-Gm-Message-State: AOAM5316r6PF+n3ruMG35dXDixsNRGbmPg2xQlNKCA5k4o20MkiowADt
        XHTPDqy5AqcsSK1173wREDE=
X-Google-Smtp-Source: ABdhPJwdFew1PgvGjIOibsn7Y2GIVG/0CjZsw4EQzpJqnDy1v24dibEssSMtO+oZcI4gTDWyiQc2wQ==
X-Received: by 2002:a17:907:7718:: with SMTP id kw24mr15106423ejc.316.1629097295329;
        Mon, 16 Aug 2021 00:01:35 -0700 (PDT)
Received: from eldamar (host-82-55-38-10.retail.telecomitalia.it. [82.55.38.10])
        by smtp.gmail.com with ESMTPSA id l9sm4393633edt.55.2021.08.16.00.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 00:01:34 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date:   Mon, 16 Aug 2021 09:01:33 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>, security@kernel.org,
        linux-distros@vs.openwall.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net
Subject: Re: [PATCH] media: firewire: firedtv-avc: fix a buffer overflow in
 avc_ca_pmt()
Message-ID: <YRoNTX3Krtw9NdkI@eldamar.lan>
References: <000001d73031$d5304480$7f90cd80$@nsfocus.com>
 <YHaulytonFcW+lyZ@mwanda>
 <YQKDtRtAC5F7W+bg@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQKDtRtAC5F7W+bg@kroah.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Jul 29, 2021 at 12:32:21PM +0200, Greg KH wrote:
> On Wed, Apr 14, 2021 at 11:57:59AM +0300, Dan Carpenter wrote:
> > The bounds checking in avc_ca_pmt() is not strict enough.  It should
> > be checking "read_pos + 4" because it's reading 5 bytes.  If the
> > "es_info_length" is non-zero then it reads a 6th byte so there needs to
> > be an additional check for that.
> > 
> > I also added checks for the "write_pos".  I don't think these are
> > required because "read_pos" and "write_pos" are tied together so
> > checking one ought to be enough.  But they make the code easier to
> > understand for me.
> > 
> > The other problem is that "length" can be invalid.  It comes from
> > "data_length" in fdtv_ca_pmt().
> > 
> > Cc: stable@vger.kernel.org
> > Reported-by: Luo Likang <luolikang@nsfocus.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > This hardware isn't super common so there is no embargo.  Resending
> > through normal lists.
> > 
> > Oh, another thing is the data_length calculation in fdtv_ca_pmt() seems
> > very suspicous.  Reading more than 4 bytes in the loop will lead to
> > shift wrapping.
> > 
> >  drivers/media/firewire/firedtv-avc.c | 14 +++++++++++---
> >  drivers/media/firewire/firedtv-ci.c  |  2 ++
> >  2 files changed, 13 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/firewire/firedtv-avc.c b/drivers/media/firewire/firedtv-avc.c
> > index 2bf9467b917d..71991f8638e6 100644
> > --- a/drivers/media/firewire/firedtv-avc.c
> > +++ b/drivers/media/firewire/firedtv-avc.c
> > @@ -1165,7 +1165,11 @@ int avc_ca_pmt(struct firedtv *fdtv, char *msg, int length)
> >  		read_pos += program_info_length;
> >  		write_pos += program_info_length;
> >  	}
> > -	while (read_pos < length) {
> > +	while (read_pos + 4 < length) {
> > +		if (write_pos + 4 >= sizeof(c->operand) - 4) {
> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> >  		c->operand[write_pos++] = msg[read_pos++];
> >  		c->operand[write_pos++] = msg[read_pos++];
> >  		c->operand[write_pos++] = msg[read_pos++];
> > @@ -1177,13 +1181,17 @@ int avc_ca_pmt(struct firedtv *fdtv, char *msg, int length)
> >  		c->operand[write_pos++] = es_info_length >> 8;
> >  		c->operand[write_pos++] = es_info_length & 0xff;
> >  		if (es_info_length > 0) {
> > +			if (read_pos >= length) {
> > +				ret = -EINVAL;
> > +				goto out;
> > +			}
> >  			pmt_cmd_id = msg[read_pos++];
> >  			if (pmt_cmd_id != 1 && pmt_cmd_id != 4)
> >  				dev_err(fdtv->device, "invalid pmt_cmd_id %d at stream level\n",
> >  					pmt_cmd_id);
> >  
> > -			if (es_info_length > sizeof(c->operand) - 4 -
> > -					     write_pos) {
> > +			if (es_info_length > sizeof(c->operand) - 4 - write_pos ||
> > +			    es_info_length > length - read_pos) {
> >  				ret = -EINVAL;
> >  				goto out;
> >  			}
> > diff --git a/drivers/media/firewire/firedtv-ci.c b/drivers/media/firewire/firedtv-ci.c
> > index 9363d005e2b6..2d6992ac5dd6 100644
> > --- a/drivers/media/firewire/firedtv-ci.c
> > +++ b/drivers/media/firewire/firedtv-ci.c
> > @@ -134,6 +134,8 @@ static int fdtv_ca_pmt(struct firedtv *fdtv, void *arg)
> >  	} else {
> >  		data_length = msg->msg[3];
> >  	}
> > +	if (data_length > sizeof(msg->msg) - 4)
> > +		return -EINVAL;
> >  
> >  	return avc_ca_pmt(fdtv, &msg->msg[data_pos], data_length);
> >  }
> > -- 
> > 2.30.2
> > 
> 
> This patch seems to have gotten lost.  Any change of it getting applied?

As far I can see there was then a version 2 of the patch, but that one
got list somewhere. Friendly ping on this thread :)

Regards,
Salvatore
