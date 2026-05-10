Return-Path: <linux-media+bounces-61032-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAWFHW2yAGryLgEAu9opvQ
	(envelope-from <linux-media+bounces-61032-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 18:29:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C35051AF
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 18:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22697300E399
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 16:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2C036605D;
	Sun, 10 May 2026 16:29:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8401365A0F
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 16:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778430562; cv=none; b=fuPChXrMz+i4ME4dZ6sYdFFUAbHMT4SBCkFW4HFMPk/ZjQKk6WjtF8dg2Mm5qFwfl3NkxGTUPBXN/gvJIkEjijp9XuY/EBq4Ox1tWRY9HaTxm3xGktRcqnmFPobxX6jsD2dIgaOrW1JtIJrBvRiv5C9uXAILMXFuC6eBEzviQaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778430562; c=relaxed/simple;
	bh=s+n+7oum+CK460mi1w+VdmYHCLlPwTP0WmQ9ThzVhJw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=dPPelcT1XkGF1NpM8zAwIc8cyzROPdJ1U2+qSCW3dNstG9xa5X5sqs4Zlh6ulRceleertrf3YZ1phg96rVYuI1xwvj1MdbuM6I03P91YIog3WRDj2XRBq7Hgyubd1xVUs+5hksOaPXKVnfqX0WJNRqhBR06vPOlAnIGq82nLbyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6948d83a5c0so8354790eaf.1
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 09:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778430560; x=1779035360;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnYGhFnm99IjX8YittGtOEKinHV6HIFzFrbpVeVez1s=;
        b=pW68V5Z5TKF1Rk1XWLGItIyNoTxTg/CpzT+zJemC5FNT2bK9dARtoH7ZoZ2dSjUb8C
         2yJdbe44ChAZNgly11im+HIxyVX4Sz+YjVKKii//RUFAq7Ai3tnTvrPubkGRlNV14Et/
         uMxeWI6yJEjr4tiE2FYQXRWZdHRd0CL7Gw8e74hpa3ABSAw1zU5YR1XANgt+NTIa7ARQ
         P8L1Zkqk4+hTEpXXrV3emvf05O+CvYMF3my6ZAjk1wg28xRgXRiuqjx6Y+A3KvvSe8UG
         ujy9x7HjdMmghxd/CbQcNBagQMQQfzJlDJBcmWgqabZG5k8TjrwFFLKFCPXfzwPZ4ujm
         Q+9w==
X-Gm-Message-State: AOJu0YwtnfRWmE2qrxcw+cnCd6mNCIziwFrqvT30igR8fOcskdQH6q7Y
	yMEeUnG/OUvVyBRbHGhG80JOWGTlEM/IPKow0M28lW/ZldCy7LQYtjH1sc38da0NWx/nmpYRZG9
	gUXXaekS+OAOQHek8lRZXwmqU2zeq+KlE6C7lRMZSN33sQtxzFfaAfKLD//0=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ee09:0:b0:694:8f5d:3cb with SMTP id
 006d021491bc7-69b36d669f4mr3207438eaf.57.1778430559943; Sun, 10 May 2026
 09:29:19 -0700 (PDT)
Date: Sun, 10 May 2026 09:29:19 -0700
In-Reply-To: <20260510162912.67381-1-mokshpanicker.7@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a00b25f.a00a0220.1c3806.0012.GAE@google.com>
Subject: Re: [PATCH v2] media: mxl111sf: fix null pointer dereference in mxl111sf_ctrl_msg
From: syzbot <syzbot@syzkaller.appspotmail.com>
To: mokshpanicker.7@gmail.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, mokshpanicker.7@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 111C35051AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61032-lists,linux-media=lfdr.de];
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


