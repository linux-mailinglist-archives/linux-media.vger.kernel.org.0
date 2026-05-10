Return-Path: <linux-media+bounces-61015-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKseHMYyAGpAEQEAu9opvQ
	(envelope-from <linux-media+bounces-61015-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 09:24:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5120502F33
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 09:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7616C3014574
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 07:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FA23612FE;
	Sun, 10 May 2026 07:24:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EFD35E94E
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778397881; cv=none; b=CPXo9e59cnEfZLnxFVKxddmJJ3nWoYGaTEzsCLX1lKpCGAi4ZMFFEgqYP+ibaHVqYq+GxiRL8bRi4e/bAPzslxvUOocysZ46vCAYtSBjRfm8JHo1FFzshy2BoDvGcGZC1IF15xgGfEUzKWunON8GWzsXx/paagbGfLpSAgzjr40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778397881; c=relaxed/simple;
	bh=s+n+7oum+CK460mi1w+VdmYHCLlPwTP0WmQ9ThzVhJw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Hwh7dxZOogeMvHEeJmWPxPDxw0lSSTgd/DwuYXDctgV1CYkZ8R6s0DZAeK2l8tnSOzCNiRC4uKp+kS1Fvg2d9PWxrEhi2IUBDE1cFD7vkfYnMF/CmXk89aEGPDVr/6EiCEiJQJpprkoFnPcpNVbGQUkKevAmj5jyw10uBVLb+Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dcd9f8dbe2so5110745a34.1
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 00:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778397879; x=1779002679;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnYGhFnm99IjX8YittGtOEKinHV6HIFzFrbpVeVez1s=;
        b=XD3AAsygO0fS0P+XXcSpvtgai60I2pQmID+4VXQFrWtUC29ptdKft/2O2tzFiXPjd9
         SDFIGl5+mOU3v3XZ4U2hRu5ym8xj7tzn5MnCxHH296qqonMCRhKfCcexY664TlJmkOsW
         7R7Cwt4jRwYQMjn9x7pGw4vAkrNpBcQkX+Zfm8vH0cZy8v0XMXKlm+JKv9RvKi1RIsnB
         x+qu4s62RZS0n2jgiw3O57MZjYtkLx6h+lZ/cc+HtdL7eb6zBbLg6qCtgNu2ha1seON9
         VNJwCvIoRFrQED5vCNDddoOLSSv+/DnPO2tmiM354yQ84dO0i1ZePNBxeEm2FRR0jH/5
         dgow==
X-Gm-Message-State: AOJu0Ywk5k+MfIwAOL+W0zJV68pCnHeIqlchLiJ1mQSqX3uKgNS1j6OJ
	LWAR/d2LhQNg1Y+DUYQ1SEnxPjmvNILGB/AEa7jhTD7OKV9VpYv96RgsQAMcgmhnw7laDtr+nL7
	a9/c4/Q3GFIqnBU2R4TWumn1FARctESgTrUVPDbPYw4ryydbF1ZoQi3NCQhc=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2017:b0:696:22dc:b4c5 with SMTP id
 006d021491bc7-69998cc4e9emr10281027eaf.17.1778397879180; Sun, 10 May 2026
 00:24:39 -0700 (PDT)
Date: Sun, 10 May 2026 00:24:39 -0700
In-Reply-To: <20260510072418.38636-1-mokshpanicker.7@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a0032b7.050a0220.103c44.0003.GAE@google.com>
Subject: Re: [PATCH] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
From: syzbot <syzbot@syzkaller.appspotmail.com>
To: mokshpanicker.7@gmail.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, mokshpanicker.7@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C5120502F33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61015-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.363];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url]
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


