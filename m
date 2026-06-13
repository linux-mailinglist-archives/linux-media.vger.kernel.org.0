Return-Path: <linux-media+bounces-64751-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yrsqHMm6LGpiVwQAu9opvQ
	(envelope-from <linux-media+bounces-64751-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 04:04:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F3E67D7FD
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 04:04:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nhqidihH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64751-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64751-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6902432BBE44
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 02:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8829B3A5E89;
	Sat, 13 Jun 2026 02:04:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A393A1E96
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 02:04:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781316243; cv=none; b=YGOF9eNrKHLsAUGper8QVimmgE9fsEY0lV2uW650iKrcqB2BgREghqVLScBAX20O1FE5untIMG7Ouu2pwso38DUhCwH9YAug+tL7xQHWwc6U1p7USdOjLQmYVYjERVrt0XGQIeyN/ovaq4a2V9YZQe3lnZ402dFOCNEATrA6CY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781316243; c=relaxed/simple;
	bh=BF63f8tkkJfZ/bY07JtFT74M8MLMPf3ZpoYhZ+oniIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTdrbsaTH48rnHSwtKGmVKfxuKDIS+HOILTAZnLzsKxEMOqJoeTDei3tAOR1Ov91BhhPA2n77LVvGtOFsnckrmOQkDDKHMNNbAce1CVI1NFI435UFqzt5sAavpoflMZOelKnW44zQO/fSYZN4O+9aPpxkTbChGNcfde+lodGY74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhqidihH; arc=none smtp.client-ip=209.85.215.194
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c8585cd8400so502871a12.3
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781316241; x=1781921041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvlrbvjYmzCXoLrV2hsJdEbJOUWSCE5NGHj2A3xomvU=;
        b=nhqidihHBRXjKuyI3jLI72GFUIyYnPkVmKDpuWeQ2HmmDsoLX6YgMwVx7gSWGDpv3E
         NppSpLpXY7S2oPkobyW/KW+6RftxJKJriOz6h75wqkk+d3lCwbnfFlQDMbi1/cLcAm0z
         a08kVwWd3Asjc6ZHCzx8Cl3kI2rjahh9QxY/ka+Aljx59VWbluWC0/XIe3FPyGWJr40Z
         v7t917/zN9x+5X1RRE1ECsWmQkP+hlsySBGx1m+PONN4wgo+BMjiaHf7lOXZhh9E4RA4
         w1bMWCTyD6LPmM+nyfG5ybAfcs/DMh2cXx4CwWZhMDCpekNzNpa9GL9VzkQNtPV55dJA
         ngAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781316241; x=1781921041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvlrbvjYmzCXoLrV2hsJdEbJOUWSCE5NGHj2A3xomvU=;
        b=iLOqvUz0UEPJu4y4/9GyVl+1zMi6vhfbT4H8Rj16Q9ROpboEbDdUaJPU9KOf6OhXzq
         p7jkmBGSP7gnBoNu8l/oI89Z0xg3GE1rxVcLTjHKT2t5B6BWRmVK1dnL7rn1Cym58HnP
         r7u1JPspSQS3xpfBTBStOazIS1fuIM/N7qP9HCNAqoxmPm7jD4hMNvgWY04pJ4AsTawZ
         NKt+epJZnSeGXmMCSwSx6EG+TOKE19KITHChBXxMeLpb8BShEalHqV13h0agDr/5Tmpg
         HreaYPc/kmaj9Bmq+5EnM/QrRrYb+CFzavYPsMYWMcpM/lKaDb/gXPGnDOpsIQixUQ0q
         QOVA==
X-Forwarded-Encrypted: i=1; AFNElJ82T7ZE61Rm6MdOnlqGh6d4EpnXoOkac4HwL+OS8B43KOwMv2dEQWo+gSYBs9AbnechPD/U2a7ZLN+Ykw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTT/93N8ap4wsThpcnYIb9Q1B9mlXW2aXotAkoA0B7F5TXl0PT
	rfDEgPZiwyPJy8nCT5eDPtpnxHlarPOwsjzO+v+dIMd6dogO3t9mswoC
X-Gm-Gg: Acq92OEiiiYBuUyCgFCyviboubTEjQktjRKz88j5gGoS8z49LNklHhWSP4gF5aTXwda
	FoksyjRsv59pfLNt46xH36bVQpsS7nH+FTmBtLDJp9TQh0vTlv/cP2PzdFnNYSRDofBiQVFEW1q
	ktW9F6MotZA6pEWJ+1M5GuUsm4z0OgSBxy7FD8HixGzj3+vU/GxNjozMrEX+936WgU4ewy8TYZZ
	35m4mrGGBnspHgqtWLeHTv6G7L2KKCwNGPV0UbRbQ3byU12HaneeF89H5M9gM3D8IkLbshalfC1
	OP392IIIybPbrrSl6/2f6DSh8w0XPYj53eC9tKnfNM6gQYT0JdP8GBxq4PKdgZLOKdLfLAwc2Mu
	UXSHW4BTha7TP1qrII9hwYkRrSv0abxymJCag1TYKixRk3bLgwTOGZWRE1SWw0ykoy9oitOwdhF
	gCtP5ACp0V23rQeLgY
X-Received: by 2002:a05:6a20:2d14:b0:3b4:6265:3786 with SMTP id adf61e73a8af0-3b784026fc9mr6690558637.43.1781316241406;
        Fri, 12 Jun 2026 19:04:01 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4e::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186d98sm3006091a12.16.2026.06.12.19.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 19:04:00 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:03:50 -0700
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
Subject: Re: [PATCH net-next v3 4/4] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <aiy6fWaIILSj6dpr@devvm7509.cco0.facebook.com>
References: <20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com>
 <20260612-tcpdm-large-niovs-v3-4-a3b693e76fcb@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612-tcpdm-large-niovs-v3-4-a3b693e76fcb@meta.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64751-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devvm7509.cco0.facebook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,fomichev.me:email,meta.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15F3E67D7FD

On 06/12, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add a new devmem test case for binding the dmabuf with rx-buf-size=16K.
> The test sweeps RX payload sizes straddling the niov boundary to cover
> the sub-niov, exact-niov, and multi-niov RX paths.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

