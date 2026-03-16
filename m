Return-Path: <linux-media+bounces-55914-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MhqFpcIuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55914-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:41:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE39729AA1F
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32E1230745E5
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 13:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C11139B49F;
	Mon, 16 Mar 2026 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3xocmMr"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E254E28BAB9;
	Mon, 16 Mar 2026 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668032; cv=none; b=RRADHN7N4LfwtLTnWnPirHbuAgf+VEJq/CMy0CVG8GjqODiTbQZvByovh/ErQK9K65zjZQ/yIpmX/mxpU2WlY3iOIzKyMcKOVYwfbG2Omg4XRmVR1SYl9oeJK+0MHOP10rto+5JcWuor6ZcCQW2gry+ygAvZxqeIsaSBZlWsmZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668032; c=relaxed/simple;
	bh=1BQ0dbGcRj9ER/i8bD69aS5hfaedzoy7JYoH0NKfmf8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PDvKN9r4Z56Qg3nktMnHTU852hpcNcm715qb5aOVxPB7Y9TxM67662oVlwDVvk7Ia5QBPMWkKGo0+p9J64FWE4GPrXKHzDcn8sajt1k7vrRmM1UInFE6jhTfLZjuvG0Ns0O7y5fJwFdy9+AqTMUBQbtLD5dNNv7x44tYR7ZIbH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3xocmMr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6256EC19421;
	Mon, 16 Mar 2026 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773668031;
	bh=1BQ0dbGcRj9ER/i8bD69aS5hfaedzoy7JYoH0NKfmf8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=o3xocmMrgc99RpTMj9AFQGql+DLtFz995tJ8DudAiTdxM94NtxLNdFDaKPm71vRLu
	 AJpZ20jLco/lbDxYLf7svfLIAijoq2NDo/WQREXpnfqeI5jOFf8d1BP6shYlK3mWjF
	 LZUIYyJQKb6zcHHCR7YPCOLNMQTJE4s+OMEY1aIpinIcIe8Tn2w5g4XKzoXXY5hvNr
	 pLavZ7/GYJlqHJNqjnFMiOJT8ldqszOvbaTvoYMwQhYgxwvXYJWmoBH2iU1E0LU1FU
	 nPgAINl9lW6SQi/jKTYV/d1gYoAQvC29A590MrZvxJcusJ6+FB82qAGGWQ7CV7Xk0z
	 CIw2axs5CoAWQ==
Message-ID: <16ac1516-781a-4cff-812f-59a30b15bb79@kernel.org>
Date: Mon, 16 Mar 2026 14:33:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] [PATCH v2] media: vidtv: fix general protection fault in
 vidtv_psi_ts_psi_write_into
To: Soham Kute <officialsohamkute@gmail.com>, dwlsalmeida@gmail.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260207203947.4354-1-officialsohamkute@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260207203947.4354-1-officialsohamkute@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55914-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: BE39729AA1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Soham,

On 07/02/2026 21:39, Soham Kute wrote:
> Add defensive validation for psi_write_args pointers to avoid
> null pointer dereference reported by syzbot.
> 
> Reported-by: syzbot+814c351d094f41a1b86@syzkaller.appspotmail.com

I can't find any report with this hash from syzbot.

Can you point me to the correct syzbot report?

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

I'm fairly certain you paper over the real bug, which is somewhere else.

The question is where the NULL pointer is exactly and why it is NULL.

Without the syzbot report I have no idea.

Regards,

	Hans

> +
>  	struct vidtv_mpeg_ts ts_header = {
>  		.sync_byte = TS_SYNC_BYTE,
>  		.bitfield = cpu_to_be16((args->new_psi_section << 14) | args->pid),


