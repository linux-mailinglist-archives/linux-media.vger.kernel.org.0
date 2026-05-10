Return-Path: <linux-media+bounces-61030-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDf6JM6xAGrALgEAu9opvQ
	(envelope-from <linux-media+bounces-61030-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 18:26:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 346BC50519E
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 18:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53148300F9F7
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 16:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7E93ACF0F;
	Sun, 10 May 2026 16:26:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C758739A800
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 16:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778430402; cv=none; b=L/TEstLMP7e39gvPQ5k66rjUQ1lwQ4+tFyFVnaKApYEnhPl//1yQnqder+0CoIDm5oYzV2xgyJKU6iKmRojbhcYlRNO0AXYa4shoxXoyiln9HSQSlUFhMnYIw7sQJmi9UlMPJnRgRI4sup0u04omFMoEP/Dp3SvDDoR0aFH6IC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778430402; c=relaxed/simple;
	bh=s+n+7oum+CK460mi1w+VdmYHCLlPwTP0WmQ9ThzVhJw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Hfgaq/Na/lKyuNOpIWU+Wr+s8sAsKkcS6L1B4XhLnH/HkZPcE/ktOgpgv7U7+csjDvf4EkhRlEDDE3rumYDY/qQNGfI4aVprpQxaNj8Aq9vkG8bdH2aqu+AfhelMQ699YwFtFTRU8qMM5Jyxs35jHuQEo4jTJOOzM7I0mSE59Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-42c0e460e4bso6776923fac.1
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 09:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778430400; x=1779035200;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnYGhFnm99IjX8YittGtOEKinHV6HIFzFrbpVeVez1s=;
        b=E/vJhFa0rsGFw0YRBDx/GfY/YZS7EH5ENvHxyT/irwvxIcLbzZX6cO3Kb1DOXXM6vl
         1UP8+/oHX8rp0yHtW1pMQjhfNArA6H6fuMadxOB7pht40qq1affus9wgejcjFO3z4ZXN
         iXt92jbUZN116pSeOjxR7c+Aokz7FXKklisHxfMmxMOuUD9gGKWruxdrdQ04DNsiZbN5
         XOSLD0qG97HdYrV/tY5x87OHbPQFxJEPYp1HBamqZ1CJ9R1VTdOZo50AlBQ7OpmaFG7V
         L+rI353R3KomyNwcwjV0WwaJSOdoPM5eji77zyEvgqlsYGvSE8TETuhvpTucAVRNo/KU
         4RJQ==
X-Gm-Message-State: AOJu0YwbF+3iZnpT6upB5DHGEYOctsaUtz6QxnEl4z9zomHCuWs1E/73
	W1s4i6Q0uQWskxc4jCr+qrUXVR83Vn3vGuwT1RlREpd8jfqADnskBsnPGwlEfm1DPo5RfPTOytF
	qASXfws4Svd61V+6mFHdRdH/HzQV6Ol1NEDlXcXNgS6LYIXyoKXVr6FsG4PI=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ee05:0:b0:696:924d:2fe5 with SMTP id
 006d021491bc7-69b25cd825emr6183726eaf.51.1778430399757; Sun, 10 May 2026
 09:26:39 -0700 (PDT)
Date: Sun, 10 May 2026 09:26:39 -0700
In-Reply-To: <20260510162632.67218-1-mokshpanicker.7@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a00b1bf.a00a0220.1c3806.0011.GAE@google.com>
Subject: Re: [PATCH] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
From: syzbot <syzbot@syzkaller.appspotmail.com>
To: mokshpanicker.7@gmail.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, mokshpanicker.7@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 346BC50519E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61030-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.363];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email]
X-Rspamd-Action: no action

> When mxl111sf_ctrl_msg() is called during early probe, state->d
> may not yet be initialized, causing a null pointer dereference in
> dvb_usbv2_generic_write() when it accesses d->usb_mutex.
>
> Add a null check for d before proceeding with the USB transfer.
>
> Fixes: d90b336f3f65 ("[media] mxl111sf: Fix driver to use heap allocate buffers for USB messages")
> Reported-by: syzbot+f9f333782a8f54509322@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=f9f333782a8f54509322
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
> ---
>  drivers/media/usb/dvb-usb-v2/mxl111sf.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> index 870ac3c8b085..9908675c355e 100644
> --- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> +++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> @@ -56,6 +56,9 @@ int mxl111sf_ctrl_msg(struct mxl111sf_state *state,
>  	int wo = (rbuf == NULL || rlen == 0); /* write-only */
>  	int ret;
>  
> +	if (!d)
> +		return -ENODEV;
> +
>  	if (1 + wlen > MXL_MAX_XFER_SIZE) {
>  		pr_warn("%s: len=%d is too big!\n", __func__, wlen);
>  		return -EOPNOTSUPP;
> -- 
> 2.34.1
>

I see the command but can't find the corresponding bug.
The email is sent to  syzbot+HASH@syzkaller.appspotmail.com address
but the HASH does not correspond to any known bug.
Please double check the address.


