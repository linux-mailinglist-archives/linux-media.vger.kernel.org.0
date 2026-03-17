Return-Path: <linux-media+bounces-56045-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GMQGxM3uWnVvQEAu9opvQ
	(envelope-from <linux-media+bounces-56045-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:12:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C164C2A88A1
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B88F31423CB
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9363A8729;
	Tue, 17 Mar 2026 11:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rihYFZEi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ABA34DCD1
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745639; cv=none; b=SFxaxeXbrY6AyDbaKipYtXo44lm7L/QDo65HYUIGzUFd6rQumXLTwQXYnDBaY8fUor67IPfGfMtdzm0g/sw/FZhI+aUJrRBjdszLib48KY8FiMsIKueWXvrRdhuQREwZSsPabWvFy2VH5vRWlc3gXkOwq9U8/hAajnHjrG/RCJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745639; c=relaxed/simple;
	bh=lGu3g53ZyuJHuG4zfyOu+gvLHybCnfvQ9y8eyDR6SsE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bKpLInWUNsCngbGG0g8arelPnfN9+1aiFjhv4MgtCcX1lxUOQcPoouVfr9fM+xBYnz7UhoIHUAzOcAksghI0MzFaUwBlaATfT2uTzPvifwEVgDFcoOOw01umUm355njm7SbHg4jmUFx+rg0+mn2mLjoX4BozCfgeu7QdRdCxmGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rihYFZEi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F440C2BCB0;
	Tue, 17 Mar 2026 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773745639;
	bh=lGu3g53ZyuJHuG4zfyOu+gvLHybCnfvQ9y8eyDR6SsE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=rihYFZEikAhAcHS1f676YTZzF2fQhbhG0jlwBsGOBhg4VcgIKFtL9oZDy1rx5Du9q
	 dP+luj4bD6GMQsT7uf0MlrDFaqBoKchLFA/6sthCpjI4GGBS4/ATeLWwDs4Tn1D+BI
	 sbPcyLEBFam8ZbMh0d2AKjv71cROGmwzq9eFCjF6W2fLsUCfs1JQ2kPppqzMZOcF2V
	 awcqSHhyXgo7nZF1wA7+DuUY/XujI9kN9go+aONbA21GIBx1VssK2MFEF0qlD5W32n
	 keMi17/zrcbY8rTtr6OQLV5Aws1987/VgiZ1IR/OjCh+iPTBX56Nx5/jTi1CWnyox5
	 u6nWm4uWRnZcA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4597AF4006D;
	Tue, 17 Mar 2026 07:07:18 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 17 Mar 2026 07:07:18 -0400
X-ME-Sender: <xms:5jW5aZDxz8weJEvriH7JWXXw_UzsF2JmqfY9MYUlrKLMQs0p7b_JGg>
    <xme:5jW5aSUO4HN9qo_Yx7IuMYB72uFhMf2CUeagoZ80iSsxandrc9vtOxukvNfUs9GUZ
    IX2jGNpNoOrauoM8VVF8wKuZAtQGiVPe_gxtSDjMKWNbmYf9wFODI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdduuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
    jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegufihlshgrlhhmvghiuggrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvggsih
    hgghgvrhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmtghhvghhrggssehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5jW5aQNkTCYw7Y9E3T40MhfmJr4PypcgyHJ0X8cb45gmgSdSSimt3A>
    <xmx:5jW5af6gIcFDUuKBSM6TywcgcCfRmdJRgeQdHqANK5PJDSM5T95-TA>
    <xmx:5jW5aS0IV3YMDtuNbH7dHNg9uVvAlsaomcWqQOrkWUoANCeDqWjDgg>
    <xmx:5jW5aYwqVBu8MEjavN1SDP-a3Pm0WLdVUNR3mW-sZS0SKunZmnaNoA>
    <xmx:5jW5aUtA4yrWRtwKlzXda_B5HaDoyFYENlt42cJ7Vz0KDyUYRNF-zT1e>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E4EC700065; Tue, 17 Mar 2026 07:07:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A9IQq0A6twnB
Date: Tue, 17 Mar 2026 12:06:57 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>,
 "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Message-Id: <c73da827-c7fe-4759-9e11-178c4f21958c@app.fastmail.com>
In-Reply-To: <20260316211542.50912-1-ebiggers@kernel.org>
References: <20260316211542.50912-1-ebiggers@kernel.org>
Subject: Re: [PATCH] media: vidtv: Use crc32_be() instead of open coding
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56045-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ardb@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C164C2A88A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Mon, 16 Mar 2026, at 22:15, Eric Biggers wrote:
> dvb_crc32() does exactly the same computation as the crc32_be() library
> function.  Just call crc32_be() instead.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  drivers/media/test-drivers/vidtv/Kconfig     |  1 +
>  drivers/media/test-drivers/vidtv/vidtv_psi.c | 57 +-------------------
>  2 files changed, 2 insertions(+), 56 deletions(-)
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> diff --git a/drivers/media/test-drivers/vidtv/Kconfig 
> b/drivers/media/test-drivers/vidtv/Kconfig
> index e511e51c0b5b..8cb10b75603b 100644
> --- a/drivers/media/test-drivers/vidtv/Kconfig
> +++ b/drivers/media/test-drivers/vidtv/Kconfig
> @@ -1,9 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DVB_VIDTV
>  	tristate "Virtual DVB Driver (vidtv)"
>  	depends on DVB_CORE && MEDIA_SUPPORT && I2C
> +	select CRC32
>  	help
>  	  The virtual DVB test driver serves as a reference DVB driver and 
> helps
>  	  validate the existing APIs in the media subsystem. It can also aid 
> developers
>  	  working on userspace applications.
> 
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c 
> b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> index 685a1f7b2fb1..1b6225d65ef3 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
> @@ -29,65 +29,10 @@
>  #define CRC_SIZE_IN_BYTES 4
>  #define MAX_VERSION_NUM 32
>  #define INITIAL_CRC 0xffffffff
>  #define ISO_LANGUAGE_CODE_LEN 3
> 
> -static const u32 CRC_LUT[256] = {
> -	/* from libdvbv5 */
> -	0x00000000, 0x04c11db7, 0x09823b6e, 0x0d4326d9, 0x130476dc, 0x17c56b6b,
> -	0x1a864db2, 0x1e475005, 0x2608edb8, 0x22c9f00f, 0x2f8ad6d6, 0x2b4bcb61,
> -	0x350c9b64, 0x31cd86d3, 0x3c8ea00a, 0x384fbdbd, 0x4c11db70, 0x48d0c6c7,
> -	0x4593e01e, 0x4152fda9, 0x5f15adac, 0x5bd4b01b, 0x569796c2, 0x52568b75,
> -	0x6a1936c8, 0x6ed82b7f, 0x639b0da6, 0x675a1011, 0x791d4014, 0x7ddc5da3,
> -	0x709f7b7a, 0x745e66cd, 0x9823b6e0, 0x9ce2ab57, 0x91a18d8e, 0x95609039,
> -	0x8b27c03c, 0x8fe6dd8b, 0x82a5fb52, 0x8664e6e5, 0xbe2b5b58, 0xbaea46ef,
> -	0xb7a96036, 0xb3687d81, 0xad2f2d84, 0xa9ee3033, 0xa4ad16ea, 0xa06c0b5d,
> -	0xd4326d90, 0xd0f37027, 0xddb056fe, 0xd9714b49, 0xc7361b4c, 0xc3f706fb,
> -	0xceb42022, 0xca753d95, 0xf23a8028, 0xf6fb9d9f, 0xfbb8bb46, 0xff79a6f1,
> -	0xe13ef6f4, 0xe5ffeb43, 0xe8bccd9a, 0xec7dd02d, 0x34867077, 0x30476dc0,
> -	0x3d044b19, 0x39c556ae, 0x278206ab, 0x23431b1c, 0x2e003dc5, 0x2ac12072,
> -	0x128e9dcf, 0x164f8078, 0x1b0ca6a1, 0x1fcdbb16, 0x018aeb13, 0x054bf6a4,
> -	0x0808d07d, 0x0cc9cdca, 0x7897ab07, 0x7c56b6b0, 0x71159069, 0x75d48dde,
> -	0x6b93dddb, 0x6f52c06c, 0x6211e6b5, 0x66d0fb02, 0x5e9f46bf, 0x5a5e5b08,
> -	0x571d7dd1, 0x53dc6066, 0x4d9b3063, 0x495a2dd4, 0x44190b0d, 0x40d816ba,
> -	0xaca5c697, 0xa864db20, 0xa527fdf9, 0xa1e6e04e, 0xbfa1b04b, 0xbb60adfc,
> -	0xb6238b25, 0xb2e29692, 0x8aad2b2f, 0x8e6c3698, 0x832f1041, 0x87ee0df6,
> -	0x99a95df3, 0x9d684044, 0x902b669d, 0x94ea7b2a, 0xe0b41de7, 0xe4750050,
> -	0xe9362689, 0xedf73b3e, 0xf3b06b3b, 0xf771768c, 0xfa325055, 0xfef34de2,
> -	0xc6bcf05f, 0xc27dede8, 0xcf3ecb31, 0xcbffd686, 0xd5b88683, 0xd1799b34,
> -	0xdc3abded, 0xd8fba05a, 0x690ce0ee, 0x6dcdfd59, 0x608edb80, 0x644fc637,
> -	0x7a089632, 0x7ec98b85, 0x738aad5c, 0x774bb0eb, 0x4f040d56, 0x4bc510e1,
> -	0x46863638, 0x42472b8f, 0x5c007b8a, 0x58c1663d, 0x558240e4, 0x51435d53,
> -	0x251d3b9e, 0x21dc2629, 0x2c9f00f0, 0x285e1d47, 0x36194d42, 0x32d850f5,
> -	0x3f9b762c, 0x3b5a6b9b, 0x0315d626, 0x07d4cb91, 0x0a97ed48, 0x0e56f0ff,
> -	0x1011a0fa, 0x14d0bd4d, 0x19939b94, 0x1d528623, 0xf12f560e, 0xf5ee4bb9,
> -	0xf8ad6d60, 0xfc6c70d7, 0xe22b20d2, 0xe6ea3d65, 0xeba91bbc, 0xef68060b,
> -	0xd727bbb6, 0xd3e6a601, 0xdea580d8, 0xda649d6f, 0xc423cd6a, 0xc0e2d0dd,
> -	0xcda1f604, 0xc960ebb3, 0xbd3e8d7e, 0xb9ff90c9, 0xb4bcb610, 0xb07daba7,
> -	0xae3afba2, 0xaafbe615, 0xa7b8c0cc, 0xa379dd7b, 0x9b3660c6, 0x9ff77d71,
> -	0x92b45ba8, 0x9675461f, 0x8832161a, 0x8cf30bad, 0x81b02d74, 0x857130c3,
> -	0x5d8a9099, 0x594b8d2e, 0x5408abf7, 0x50c9b640, 0x4e8ee645, 0x4a4ffbf2,
> -	0x470cdd2b, 0x43cdc09c, 0x7b827d21, 0x7f436096, 0x7200464f, 0x76c15bf8,
> -	0x68860bfd, 0x6c47164a, 0x61043093, 0x65c52d24, 0x119b4be9, 0x155a565e,
> -	0x18197087, 0x1cd86d30, 0x029f3d35, 0x065e2082, 0x0b1d065b, 0x0fdc1bec,
> -	0x3793a651, 0x3352bbe6, 0x3e119d3f, 0x3ad08088, 0x2497d08d, 0x2056cd3a,
> -	0x2d15ebe3, 0x29d4f654, 0xc5a92679, 0xc1683bce, 0xcc2b1d17, 0xc8ea00a0,
> -	0xd6ad50a5, 0xd26c4d12, 0xdf2f6bcb, 0xdbee767c, 0xe3a1cbc1, 0xe760d676,
> -	0xea23f0af, 0xeee2ed18, 0xf0a5bd1d, 0xf464a0aa, 0xf9278673, 0xfde69bc4,
> -	0x89b8fd09, 0x8d79e0be, 0x803ac667, 0x84fbdbd0, 0x9abc8bd5, 0x9e7d9662,
> -	0x933eb0bb, 0x97ffad0c, 0xafb010b1, 0xab710d06, 0xa6322bdf, 0xa2f33668,
> -	0xbcb4666d, 0xb8757bda, 0xb5365d03, 0xb1f740b4
> -};
> -
> -static u32 dvb_crc32(u32 crc, u8 *data, u32 len)
> -{
> -	/* from libdvbv5 */
> -	while (len--)
> -		crc = (crc << 8) ^ CRC_LUT[((crc >> 24) ^ *data++) & 0xff];
> -	return crc;
> -}
> -
>  static void vidtv_psi_update_version_num(struct vidtv_psi_table_header *h)
>  {
>  	h->version++;
>  }
> 
> @@ -173,11 +118,11 @@ static u32 vidtv_psi_ts_psi_write_into(struct 
> psi_write_args *args)
> 
>  	if (!args->crc && !args->is_crc)
>  		pr_warn_ratelimited("Missing CRC for chunk\n");
> 
>  	if (args->crc)
> -		*args->crc = dvb_crc32(*args->crc, args->from, args->len);
> +		*args->crc = crc32_be(*args->crc, args->from, args->len);
> 
>  	if (args->new_psi_section && !aligned) {
>  		pr_warn_ratelimited("Cannot write a new PSI section in a misaligned 
> buffer\n");
> 
>  		/* forcibly align and hope for the best */
>
> base-commit: 2d1373e4246da3b58e1df058374ed6b101804e07
> -- 
> 2.53.0

