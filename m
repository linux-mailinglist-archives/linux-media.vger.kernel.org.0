Return-Path: <linux-media+bounces-64632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZzqTBIMnK2pH3QMAu9opvQ
	(envelope-from <linux-media+bounces-64632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 23:24:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFEE6756DA
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 23:24:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H6dG2yl2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64632-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64632-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3339E3097EA3
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 21:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F5F3806D8;
	Thu, 11 Jun 2026 21:23:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C16C37417B
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 21:23:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781213017; cv=none; b=Y2kHqiorDmxsjpl4neVHrBo6CcVgte7CnK6eHTVX58vXEMEg50twdbvf3ro8f6V357qCmj4K3LEGS/9f24A4gbcEMjH1+TO2CR4/Dep8AM8evNpzw1LAPwRDz7mYAQjtP0/b3V3dGHNkGgBvjL5gZM/qCyt++W9lCvJ8EZ0ardY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781213017; c=relaxed/simple;
	bh=oW4BQVUMFiOSZ6wG+yY+yDEPmzWrRE0msdDCfL+5TSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fcftz8F237jhycGU2vGg9aN67+pgk1GqAflRQpAyy5LTnOyLKkjZfLkMU7xthoXVKOV/xfhWXhq4YfnCqfD2r1u3zcYaEYpo9x7LYPUi4dR8x3/NZOT9OeuRoFriPcIwEROwfPv6Vekz32rqkk/sDe0YJjlT+RhOdchPbN8R0+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6dG2yl2; arc=none smtp.client-ip=209.85.216.67
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so273345a91.2
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 14:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781213016; x=1781817816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SYDMbx/NSE1Ez69WzG00jvFaSdDUPkagmOI6dnx+MPA=;
        b=H6dG2yl2zJV/oKbbYQu6GCcipBPkFdU0M68TUvQ+4rx9XybSeI9BJAXpBU2r1Y8Bhx
         JEaawpzprqlLju87kM56ITzt9zRv9vjRL2nXeSY2adcsPsLaTrvLjp7BEuUNzyWRe2sI
         C59Qzk3EUF0uOJ0iseAeGFQYGYnVO9UlF1vpdXsTFTSDeY1L4tArl3CGZGC70uhQHfZ9
         DJmL5kiCn55IVQ3mhMvolHfzns9+IYocS58XvL6dD0znBsMxC6O3qoiu5VexSful6n53
         NrZ0rzuA7lBn3bA9XI1oZDj/rry8cvGrRNlhPW6vv0x57gu8JR5qTbRu8kyRz916ke6k
         I4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781213016; x=1781817816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYDMbx/NSE1Ez69WzG00jvFaSdDUPkagmOI6dnx+MPA=;
        b=OWl1lM4CqO0xxeADUO0IgC6PXL3VIJlUVvYc/u9tdUvXKKNPAiQkMwBUEbFHdiu1Ed
         /YD9v7CLTsJZTQsF9l3Zl2Oxs8cgXSLbgtRJ+Sk3XrkvTFSQDSQQPUzcDXZVxJ63Xw5/
         DT/8YSnc1B3bJoqY3JIpwot3vMefDJfeFCtvG7ay1SWiFRnDQBWCTncVgt/L0d3cJiU2
         +orVjyfo4fSyPwrImE/c1aiOZmGRVRNGsz5JVS5+Svn2UxdXCApfwU1G+enm9MFvKNCw
         MhpaYTCu5GcipAESZlsBNEvGVTClbOugQxjz6qSO46O/FZHK6XzcfV3IHfaC1Oe9dNCJ
         xrLA==
X-Forwarded-Encrypted: i=1; AFNElJ+f+ibyi93bKIhP6Bh00t8cgy2vK67TML4VPVKPrbc6Iwq3ZUJbcqJMCb7aUUybk7v1wP7F2MUWq+4trg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3NwnPbPL9x46nUMgEchrplnv27JY/3r0oRYQ44oZfphS7cw/U
	cTsbGTBjlw/+BMXV6DiPkJmEhGPmULXDerVsNhnFkEQifE01bC85HDqC
X-Gm-Gg: Acq92OFv4QE0+9/n730j+kAeX+ETLSRq4PEykeNUd+ZceopGo9MztRu+Y9LKVwl4FGJ
	7xz5nMt4DmB3NmKli0fQgBbiWgESnAjYxiRzzZxAwZwO2Lj+pL4Ee8W2t29gYx5I5+0TnYinr6+
	3b0/J7qQVrtB/c6CX0fCMOUNzsuWL9n33QMLIFePYt2gJFOoSIr5m97E2TJetQO0fzizGYjSwp8
	MOA4Znqqz/grILcJVmfEuV2SQykZwgBQbEWxPUTLEuYQL5PY0GzL04bhMjShbebU8wbyYu8VkhM
	75XtE6XWVRkXnZSidPE1G/cy05CbogJ18ZESiG9nr9ieJ1GlkFoi4epuToyEQnafsBWvrYQX5rf
	GZnb9bytRI4VTi/bMRtZUqxBg7HZM+8+p+RWYUYhofwkctywwWbr7S/wZJ5UoeXeG+BUqcRF36r
	kQiZ5N0SPmTqVPEZI=
X-Received: by 2002:a17:90b:2c8d:b0:36b:91a3:6af3 with SMTP id 98e67ed59e1d1-37a01c350c5mr145061a91.7.1781213015970;
        Thu, 11 Jun 2026 14:23:35 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:9::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3774f99cf24sm3481176a91.0.2026.06.11.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 14:23:35 -0700 (PDT)
Date: Thu, 11 Jun 2026 14:22:54 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, sdf@fomichev.me, 
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com, matttbe@kernel.org, 
	skhawaja@google.com, dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 3/4] selftests/net: ncdevmem: add -b option
 to set rx-buf-size on bind
Message-ID: <aislm0fS2MSDMzKf@devvm7509.cco0.facebook.com>
References: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
 <20260611-tcpdm-large-niovs-v2-3-ee2bf15e7523@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611-tcpdm-large-niovs-v2-3-ee2bf15e7523@meta.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64632-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bobbyeshleman@gmail.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sdfkernel@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sdfkernel@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devvm7509.cco0.facebook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,meta.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FFEE6756DA

On 06/11, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add -b <bytes> to request a non-default niov size via
> NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
> udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
> hugepage produces one naturally-aligned sg entry.
> 
> Reject values > 2 MB up front: MFD_HUGETLB + udmabuf can only guarantee
> 2 MB per sg entry (one hugepage), so a larger rx_buf_size would fail the
> per-sg length/alignment check.
> 
> Add CONFIG_HUGETLBFS=y to drivers/net/hw/config so the new path is
> reachable in the CI kernels built for these tests.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> ---
>  tools/testing/selftests/drivers/net/hw/config     |  1 +
>  tools/testing/selftests/drivers/net/hw/ncdevmem.c | 49 +++++++++++++++++++++--
>  2 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/config b/tools/testing/selftests/drivers/net/hw/config
> index cd20024218cd..ed8642b68094 100644
> --- a/tools/testing/selftests/drivers/net/hw/config
> +++ b/tools/testing/selftests/drivers/net/hw/config
> @@ -3,6 +3,7 @@ CONFIG_FAIL_FUNCTION=y
>  CONFIG_FAULT_INJECTION=y
>  CONFIG_FAULT_INJECTION_DEBUG_FS=y
>  CONFIG_FUNCTION_ERROR_INJECTION=y
> +CONFIG_HUGETLBFS=y
>  CONFIG_INET6_ESP=y
>  CONFIG_INET6_ESP_OFFLOAD=y
>  CONFIG_INET_ESP=y
> diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> index d96e8a3b5a65..325c128191e2 100644
> --- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> +++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
> @@ -61,6 +61,7 @@
>  #include <sys/time.h>
>  
>  #include <linux/memfd.h>
> +#include <sys/param.h>
>  #include <linux/dma-buf.h>
>  #include <linux/errqueue.h>
>  #include <linux/udmabuf.h>
> @@ -79,6 +80,7 @@
>  #define PAGE_SHIFT 12
>  #define TEST_PREFIX "ncdevmem"
>  #define NUM_PAGES 16000
> +#define MB(x) ((x) << 20)
>  
>  #ifndef MSG_SOCK_DEVMEM
>  #define MSG_SOCK_DEVMEM 0x2000000
> @@ -100,6 +102,7 @@ static unsigned int dmabuf_id;
>  static uint32_t tx_dmabuf_id;
>  static int waittime_ms = 500;
>  static bool fail_on_linear;
> +static uint32_t rx_buf_size;
>  
>  /* System state loaded by current_config_load() */
>  #define MAX_FLOWS	8
> @@ -142,6 +145,7 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
>  {
>  	struct udmabuf_create create;
>  	struct memory_buffer *ctx;
> +	unsigned int memfd_flags;
>  	int ret;
>  
>  	ctx = malloc(sizeof(*ctx));
> @@ -156,9 +160,14 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
>  		goto err_free_ctx;
>  	}
>  
> -	ctx->memfd = memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
> +	memfd_flags = MFD_ALLOW_SEALING;

[..]

> +	if (rx_buf_size > (uint32_t)getpagesize())

What's the logic behind explicit (uint32_t) cast? uint vs int
comparisons should promote the int to uint automatically?

> +		memfd_flags |= MFD_HUGETLB | MFD_HUGE_2MB;
> +
> +	ctx->memfd = memfd_create("udmabuf-test", memfd_flags);
>  	if (ctx->memfd < 0) {
> -		pr_err("[skip,no-memfd]");
> +		pr_err("[skip,no-memfd%s]",
> +		       (memfd_flags & MFD_HUGETLB) ? " (need hugepages)" : "");
>  		goto err_close_dev;
>  	}
>  
> @@ -168,6 +177,11 @@ static struct memory_buffer *udmabuf_alloc(size_t size)
>  		goto err_close_memfd;
>  	}
>  
> +	if (memfd_flags & MFD_HUGETLB) {
> +		size = roundup(size, MB(2));
> +		ctx->size = size;
> +	}
> +
>  	ret = ftruncate(ctx->memfd, size);
>  	if (ret == -1) {
>  		pr_err("[FAIL,memfd-truncate]");
> @@ -699,6 +713,8 @@ static int bind_rx_queue(unsigned int ifindex, unsigned int dmabuf_fd,
>  	netdev_bind_rx_req_set_ifindex(req, ifindex);
>  	netdev_bind_rx_req_set_fd(req, dmabuf_fd);
>  	__netdev_bind_rx_req_set_queues(req, queues, n_queue_index);
> +	if (rx_buf_size)
> +		netdev_bind_rx_req_set_rx_buf_size(req, rx_buf_size);
>  
>  	rsp = netdev_bind_rx(*ys, req);
>  	if (!rsp) {
> @@ -1411,7 +1427,7 @@ int main(int argc, char *argv[])
>  	int is_server = 0, opt;
>  	int ret, err = 1;
>  
> -	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:n")) != -1) {
> +	while ((opt = getopt(argc, argv, "Lls:c:p:v:q:t:f:z:nb:")) != -1) {
>  		switch (opt) {
>  		case 'L':
>  			fail_on_linear = true;
> @@ -1446,6 +1462,33 @@ int main(int argc, char *argv[])
>  		case 'n':
>  			skip_config = 1;
>  			break;
> +		case 'b': {
> +			char *endp;
> +			unsigned long val;

Christmas tree here as well?

> +
> +			errno = 0;
> +			val = strtoul(optarg, &endp, 0);

[..]

> +			if (errno || endp == optarg || *endp || val == 0 ||
> +			    val > UINT32_MAX) {
> +				pr_err("invalid rx_buf_size: %s", optarg);
> +				return 1;
> +			}

This is too sophisticated :-/ Just (if val == UINT32_MAX && errno == ERANGE) ?
(you're looking for an overflow here supposedly?)

[..]

> +			if (val & (val - 1)) {
> +				pr_err("rx_buf_size must be a power of 2");
> +				return 1;
> +			}
> +			if (val < (unsigned long)getpagesize()) {
> +				pr_err("rx_buf_size must be >= PAGE_SIZE (%d)",
> +				       getpagesize());
> +				return 1;
> +			}
> +			if (val > MB(2)) {
> +				pr_err("rx_buf_size > 2 MB not supported");
> +				return 1;
> +			}

We already check these on the kernel size, so should be ok to drop? 

