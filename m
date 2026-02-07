Return-Path: <linux-media+bounces-52340-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBMrEoOjh2lSbAQAu9opvQ
	(envelope-from <linux-media+bounces-52340-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 21:41:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8A3107177
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 21:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFEBB3034B22
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 20:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1124A34F250;
	Sat,  7 Feb 2026 20:41:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBE3340D82
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 20:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770496866; cv=none; b=pBOmX10NhZNMD71Po/jeT+6XBWslab3Ci47Z6MrdvbSTfBkUzIyRhBjigPLsUMlUwSzweGH8udubdDdFXbSWtgVklV25Yk5ebBml4l6eRqKVQFX5PBGM2PWfSfd4gFpu00y/0eRY4jwXbv5RR8KaZosofuWWvBmYn+KQUAJ5ujg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770496866; c=relaxed/simple;
	bh=NFXuObFz3vJ7A/dKbK+nsio1OTd6Mx/eOzYPUlA2wM4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Le8XBxrBWqj6P6XwHvtJxBRm7W8VR75vRUW+iLxLjxMC7ozEwM6lPeMGgGX/Zk9Wj0tqUynIkx3hW5gUHQdmKm7vCDIJlAxyKTb0bN4Vsp+PqZktrJ9AUx4fRaAWfwwU22n4ZkoRd6RBzQ3FeWMNZY/DeZVgKik9rKYHOq6aTE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-409648bc2a2so12487479fac.3
        for <linux-media@vger.kernel.org>; Sat, 07 Feb 2026 12:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770496865; x=1771101665;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PC+oCfOCUCeUZ9L6PdRZhmmR2J02PgZpdyewNc1ze6k=;
        b=EcN5QOL/nXdn4Lgimr7/U7qdDzc5YVhVZnw2HzlK9xlbhwJJ+I3BjaUovymvu+UoPx
         fvllBlyh2Os+unyguPEHIVIRAS8OS8sAbFY6OsXSXIeOMj2qL6eOFhd3ytZoBNAkUDXT
         klVc3Xcz0uv+7C8dYtHmuPsViR9pfx0PnbOGvU6krpLz5nQ/kWx3hrDx8A7B/Vg7Agz8
         Fn4TdKCsAcTnXspMCnsKEa1RiLXNO8+8ox+HWjDvKyGTvI0LfN/0+xIrFHdHf/N6M1Oo
         +jc51Ub4Y1ExPzi4G0O5hW9K1nIhldBEvDKOOmKn0zM23u5YZ08tR98gDTRqo44/PYtv
         eggg==
X-Forwarded-Encrypted: i=1; AJvYcCWpZJDsk4lxhLD7I40WnN5AUys/TD4brHsuNxDBQjgNj4/cgds8BgVzMFLuIZzpMZfBzR/2sLBSxhoi8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTdGrfuLei5lVWnha2oNdyWFB3yB9BVaIwRTwOn8FRQasmA2w7
	uwGu+T5fTZLF+GmE2OwtIou/YVc5NajayjRWMm4ol11GIADl6IAg3JNRBUIgazLCso36vyv7OjO
	nod6Ubg67zXR6su2ijk0tydMN/3x0ovX4GyNRt7gqoh5Z42801SSS1x/r2IE=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f022:b0:659:9a49:9026 with SMTP id
 006d021491bc7-66d0d6dc730mr3012398eaf.83.1770496865453; Sat, 07 Feb 2026
 12:41:05 -0800 (PST)
Date: Sat, 07 Feb 2026 12:41:05 -0800
In-Reply-To: <20260207203947.4354-1-officialsohamkute@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6987a361.a00a0220.34fa92.0037.GAE@google.com>
Subject: Re: [PATCH] [PATCH v2] media: vidtv: fix general protection fault in vidtv_psi_ts_psi_write_into
From: syzbot <syzbot@syzkaller.appspotmail.com>
To: officialsohamkute@gmail.com
Cc: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, officialsohamkute@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52340-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD8A3107177
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


