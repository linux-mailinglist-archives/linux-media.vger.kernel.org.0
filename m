Return-Path: <linux-media+bounces-52338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAINB82dh2kKawQAu9opvQ
	(envelope-from <linux-media+bounces-52338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 21:17:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0571070A9
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 21:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D12B3007207
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 20:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB4733C513;
	Sat,  7 Feb 2026 20:16:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879ED33BBD9
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 20:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770495413; cv=none; b=MAKQH6kFAONquSagSqPWgPiT0TZIepdrbb+mRHPrG8bLJQzTI0pauYpMWpWN5MJEIN3/N698y/mAquNo2wlcoYGUf67bZTsaL53rCkTXNLlcDaag9kWn99w6ZAH2SWM5naBpKGZxlvu3vtlj+Kpkoi9QFANLhpZdDNTouzUSSIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770495413; c=relaxed/simple;
	bh=NFXuObFz3vJ7A/dKbK+nsio1OTd6Mx/eOzYPUlA2wM4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=H498kdNcW5UPz6KOgeGlFj49RasJ+rXvjn5Dn1Duhf4kPUvzVPwN+1oDc1KARtGV0Jc+5544gT4BJbNZiELMWvV8efY9PU1lySM+97NBQtDhtqAUNneMadgdoLumpR8Bgrz56HBxdZLWeD0z313IKU3j4KxrfVJbinNuszFIruI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-409648bc2a2so12402621fac.3
        for <linux-media@vger.kernel.org>; Sat, 07 Feb 2026 12:16:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770495412; x=1771100212;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PC+oCfOCUCeUZ9L6PdRZhmmR2J02PgZpdyewNc1ze6k=;
        b=ut0wbhociKRwkGOUDjvlmY1W/lFQwwqp1ggcfZwe+TFqf3hVvqyoraEGaX2nFoGiOd
         lSGiRsTNdDvTkXpstWephgJ/MLes2Nf/XFcOcAvHjcWHbHV3yvAob1Y9vM8iiIzYFiyf
         OAo6t9ekX90dJ/ZGZhDxKdaP5qEiq/z3MLfCvJasAavuVJ6ZCBbDZ2O6q90ytwWJd2jY
         xkLAWHaRBMAON6V/4r0uTyCEIQHNuJTb9wJwYQnjppU9dMbd0k9oPnQ1Pu4L0ZUlzUz3
         GljS4WF9ZH8pylvDO6/36jDMdlk7h2GGIznaUWU1HJcGbB/v618CXq7XKcXg0Tl5od8T
         lr2w==
X-Forwarded-Encrypted: i=1; AJvYcCVUOimARynLf3B/n6F8ybGwoZy3SpBHn5am0qA7C+pf/idpP4gMXbF1Y6XohD/gqiGm5OUenWBz/Yu4Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsK+KVDGcwb5iOjEi3MFiEq1zxQmqVG5SeusH7dNvpoJaXan0j
	Qid0J879MKTyL3r2cgJnRPh/G1eO1Eo7CAoRshIuOXhX6ahV6RyxGkBE0M2G2+KJo7tmOJWO6d7
	wuEyK7m5CMImyoI8gE3peqhfivZpG8+1iNn0TJIDHbFC/V5EUqvElqFFIYLU=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:220b:b0:664:86ce:df3f with SMTP id
 006d021491bc7-66d0bea8a2fmr3870902eaf.51.1770495412480; Sat, 07 Feb 2026
 12:16:52 -0800 (PST)
Date: Sat, 07 Feb 2026 12:16:52 -0800
In-Reply-To: <20260207201601.50478-1-officialsohamkute@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69879db4.a00a0220.37c87e.0040.GAE@google.com>
Subject: Re: [PATCH] media: vidtv: fix general protection fault in vidtv_psi_ts_psi_write_into
From: syzbot <syzbot@syzkaller.appspotmail.com>
To: officialsohamkute@gmail.com
Cc: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, officialsohamkute@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52338-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3F0571070A9
X-Rspamd-Action: no action

> Add defensive validation for psi_write_args pointers to avoid
> null pointer dereference reported by syzbot.
>
> Reported-by: syzbot+814c351d094f41a1b86@syzkaller.appspotmail.com
>
> Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
> ---
>  drivers/media/test-drivers/vidtv/vidtv_psi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> index 2a51c898c..bac0ea03b 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> @@ -156,7 +156,13 @@ static void vidtv_psi_set_sec_len(struct vidtv_psi_table_header *h, u16 new_len)
>   * add stuffing (i.e. padding bytes) after the CRC
>   */
>  static u32 vidtv_psi_ts_psi_write_into(struct psi_write_args *args)
> -{
> +{	
> +	if (!args || !args->dest_buf || !args->from ||
> +	    !args->continuity_counter) {
> +		pr_warn_once("%s: invalid write arguments\n", __func__);
> +		return 0;
> +	}
> +
>  	struct vidtv_mpeg_ts ts_header = {
>  		.sync_byte = TS_SYNC_BYTE,
>  		.bitfield = cpu_to_be16((args->new_psi_section << 14) | args->pid),
> -- 
> 2.34.1
>

I see the command but can't find the corresponding bug.
The email is sent to  syzbot+HASH@syzkaller.appspotmail.com address
but the HASH does not correspond to any known bug.
Please double check the address.


