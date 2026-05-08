Return-Path: <linux-media+bounces-60940-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFrPErAv/mmvngAAu9opvQ
	(envelope-from <linux-media+bounces-60940-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 20:47:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8884FAC21
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 20:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4EBAE301D4FC
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 18:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75543E51E3;
	Fri,  8 May 2026 18:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBL9NaRg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8FD283C83
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778266028; cv=none; b=IllyyqoaL45UhmX1XeRL0sRbn3NHy+f7wcfdYH9tINsAUgGLwIPwRJbumLbNtwVvaXYoKwlDfvM9u4jm/rwkKfT8igMYdWv56WVSf1U8CJ+Y8XOrVdG1nmjm2tx6qILSwCJPpYQ6zy6zt5stzly47xEfUXfhTWZsNSMtDLLyYsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778266028; c=relaxed/simple;
	bh=eaqpf2ivuTcwfivhoAiZkqb796nN4j9k5Bv6JOQRQXY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XLVZvtevUL8WmtMWTc/Z3/HO2yIWTyJoaOG2b0J2puoFBk7QRRRL8JTDUX5FwvCvWCb6e0SfWozFyEJvvYgZAB+dR6QCgKKUNMhaXoTsIlWBVdqqKH8gjtSRkixSgEnskfLb28DAH8riCQanZOzjiIOttyQ6jDDokUhrRXTbxXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBL9NaRg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso16139905e9.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 11:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778266025; x=1778870825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoLj3O/cwM27sEMxcTUy7jHQ6GFmhl6pvmSQAeSJBkg=;
        b=jBL9NaRgp2YhfIs8L5slZQZoM8CmLA9+diokmlLeAfBOzQEMad151VPH3uyRD0mbbX
         pNw28DmDSrZ+YbSZ/ncBMUgMtygw8NawCvBqIpkiQhDmMrJwGFdQWtEYW9JrRUd1ECxD
         +HMLd8eOxcN9Do5BI5yRNWxy6+glfjVnGns+onIAb9drPyTvLjda3Qzu+3lIszaEXDok
         xoq4o4OieH+MrGYYuRDOFAtjY1RzjjyOH5dQT5rV+IGmxryi2ykV5jA5hHXdBuDuWb9A
         RiZxhFNyyuZzXieTx315zPhxHsiUDpMjX9GQ5Dt2cvRie5A5o4/yxIUVmY0B25gEIJPq
         b/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266025; x=1778870825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EoLj3O/cwM27sEMxcTUy7jHQ6GFmhl6pvmSQAeSJBkg=;
        b=itP+1ZP5zKEagFFm4q78OWXx2nWKJ185ZrgujKwr+VrYP5ZhFuP+sieiPryvJ9IisM
         dOhDfxIjm9Nw1l8lc4wJrP+SCHAEY6AaOFzgf9bZ+g8IJLqoStIVA4S3XYidFjD7TiJw
         tsl/pK0JfXWLYZe+i5bvk4yN8JyuxYqh6FZSEfH/JtDcg1u1jsZBu6Ap66awQxcWx9TN
         oj+RB/Y69pcX0HDyiTqkdS63sit1turG7Rp3H4MaXwS8dG3tPL386uWdTB1sgrzekWkt
         YRJJ0QhSPjazvYlwDSS/AUsXRTo9vTz3uru3bRTSpdD0FpMEQ20MLu8TobkMmvOv/dQk
         bZUA==
X-Forwarded-Encrypted: i=1; AFNElJ8KukU1io8WPwATXRh6Xu+UsgyqPYv7Sn0UprrhmC947Wd8ENfca5TVrRRg4Y64GNALfBqXjEOElSEMqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrtrJgEgYXBZsVU9we625ryaBfg9iGrg5xvDKjmT/SQV1Rw1ga
	D7K++Ivm4qggSXzCjAGyOFVoogpYDU9NPfxdhUOVr7FFmWQOkeREHoKO
X-Gm-Gg: AeBDieuOnQYB4GbgieR5/xOK2+ErqjiBNwarpv9PVabaeZwKpjpjiIqSCwJUknFyE9E
	WUXGqlC1/ct4UYd602N/okxpQd1KyfNauLmprZnt78Vd9q7+RTCj9J/pma9ZfJmfwGeOybqdayL
	kfEaoVdzxE3pJERPEdKg9FnPRHrAF0aZb5kP3D7Zwm3zyF0yt/1P1PFrRcKPjBgxqyWUlZPWQX9
	v1ABr9UHXbDmLJdjHJI6hZcuFXCsrzXpewxPoAsLM06SMySirbAQUJplAo+ee4V7zLckiijItTj
	9zv9oRmasiLG5ATT498v5sswfCw4l/qqWlmTqDCNH+uWdZV6QNgoasZHrkb2NW+yT1KoggBFcEI
	NlazZeKidb4eefwd5iHBMBeUEHMMBGhfkMd8DQnt3WSXufRVtLkOoavht18jphhGl857N2lm2EG
	lmQK9og3auGW/UyN7GB29vUZaB2RzRcFpCnSGDyp8haGPJdRqmWnQ4LcT62mfPBnhBztb6qzT5f
	7o=
X-Received: by 2002:a05:600c:4703:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-48e676ac055mr59779135e9.21.1778266025052;
        Fri, 08 May 2026 11:47:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d895781sm14304815e9.0.2026.05.08.11.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:47:04 -0700 (PDT)
Date: Fri, 8 May 2026 19:47:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bin Du <bin.du@amd.com>, Nirujogi Pratap <pratap.nirujogi@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sultan Alsawaf
 <sultan@kerneltoast.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] media: platform: amd: avoid -Wformat-security
 warning
Message-ID: <20260508194703.058c59e6@pumpkin>
In-Reply-To: <20260508124402.3082615-1-arnd@kernel.org>
References: <20260508124402.3082615-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BB8884FAC21
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60940-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Action: no action

On Fri,  8 May 2026 14:43:49 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added kthread_run() call passes a string variable as an sprintf()
> style format, which gcc warns about when -Wformat-security is enabled:
> 
> drivers/media/platform/amd/isp4/isp4_subdev.c: In function 'isp4sd_start_resp_proc_threads':
> include/linux/kthread.h:71:16: error: format not a string literal and no format arguments [-Werror=format-security]
>    71 |         struct task_struct *__k                                            \
>       |                ^~~~~~~~~~~
> drivers/media/platform/amd/isp4/isp4_subdev.c:596:38: note: in expansion of macro 'kthread_run'
>   596 |                 thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread,
>       |                                      ^~~~~~~~~~~
> 
> Use an indirect "%s" format to do this safely, avoiding the warning.
> 
> Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
> Tested-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: avoid overly long line
> ---
>  drivers/media/platform/amd/isp4/isp4_subdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> index 48deea79ce6c..427e9ba910bb 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -595,6 +595,7 @@ static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
>  
>  		thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread,
>  						 &isp_subdev->isp_resp_para[i],
> +						 "%s",
>  						 isp4sd_thread_name[i]);

I don't think the line break is needed.
I always prefer a line break between the format and arguments when the whole
lot doesn't fit on one line; but here it fits.

-- David



>  		if (IS_ERR(thread_ctx->thread)) {
>  			dev_err(dev, "create thread [%d] fail\n", i);


