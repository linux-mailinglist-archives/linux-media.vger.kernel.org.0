Return-Path: <linux-media+bounces-64310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a8edJv8wKGpo/wIAu9opvQ
	(envelope-from <linux-media+bounces-64310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 17:27:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C316661BB3
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 17:27:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Tdo4Gkb7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64310-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64310-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 741513079916
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 14:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F165A43CEDB;
	Tue,  9 Jun 2026 14:58:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56EB23D2A4
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 14:58:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017115; cv=none; b=KMEewuSH+uTzNgtDpL4Xu3+EMUC8SGJeYwWhzn7pntARcRBA/Lh/Uuwq5QZKzPJYp2TsFKyLNaqxzeOfg8WcJUmcHCMadVVmCsDKPDAlCYNb1sYjswQz504CBQG+FJT4PKNAKWZi13SHKIK2MhF3B9dE/KnrLeTFBlTUd96TF7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017115; c=relaxed/simple;
	bh=89JGksdThCij5+VjGUOcb5O/ZGVRmOdgNkQwA8TGZlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwJ1pqyZeospXM28x+RS14lLFuO6hBpwMfklNRyRetk9YvLUZghPuNSu+00eyQCc45bJW7hdCKrW4R7TezISTeJ8urA0B1DlvwtTQ2gP1BsKdPqy0KyiHazNep85OUJX/ArEoNMj+2bozLRQMD/hQwrnWMEQe/15OyBqrEcMbHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tdo4Gkb7; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c3315c5dso59745155ad.3
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2026 07:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017112; x=1781621912; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eFoSbz/qa2j2QRMMIew+HXblnpoKHM6VjME/GNmQDGg=;
        b=Tdo4Gkb70sz1WZpRhmXsMMAbsW5c5IptasOp/N1KcmZvLYbw+P0Tf21pdZb6BjM/rm
         Cpl886tq8iW0aVwtWQz7V1l8l42mami4zZCtQzu0NO6YLf+BW6k4XgXFk8Q+sY1tk9xP
         3My6QwJlLb95bjiFQds12dOvrT9NQRdBxym6IAreSNwKTVv4mrJ/XSY/0yPoc1WSExq0
         ZGTQS66UR4kOUBUjSpMtEL+CA5mDrTw/Gj8I1q+9v6EFOB81Qrpg3rTpUgX33aDdScDi
         8HySQQf8W9Fz2QJqzOUMd9kLnQRXH8ULJSuuSvFxMDVPQKF9GsqCyvubMJ8rthiFjoal
         YpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017112; x=1781621912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eFoSbz/qa2j2QRMMIew+HXblnpoKHM6VjME/GNmQDGg=;
        b=WEhk35qS+Gic6S0qjjA9AGcaC5DJ5xfauOWPUj18Q7H/pleIjQrcvj5acc/ipHjPCF
         XaDanncwAaClMuyhQyyfmZ2S9a5B3u/9aIYomtoBJeBOfQpRxlUxFpaoE65OZDcUfiWp
         JO3EL+sNmvHhfBcV/Cy8haxP3iXgQVpMyQ/RFUV9H0vNHwak2pzqK2KUD1CorihyF+Fs
         ee7s64XdJapB0x6wST63XQebs4aZ1HbkyhApiciETlSZxDnw3/8fded/97EREgX2w3fO
         0KTUnyhvnyx9CSPLKLpBZm81madgTjS/TiGlqz74xU7AAuffMVyDnABml5Dl84eqkViR
         m8bw==
X-Forwarded-Encrypted: i=1; AFNElJ+AIMa2r636q5YVE0MYEtQbIH9ddKcn7SJVdp9x1cF4Oi6h5wO30eS8tJyfuNXNF5LwWFTJzYi7RIr4Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxddFhsIoGSDL48YS4TTWVw+pf886UaV3YiAJl2qsKRG0GblDeH
	BJZ0h9w0fagwK/1p1SX7iJ2Q6QcCbp1aCbNq9YvFP7J/lDN2g0vZWK/L
X-Gm-Gg: Acq92OGTj0p6GFlJxoxSJvXg9p8s2+6wXPDwQm2I4uYFZbqXCKVozqMwuX5QwcyjUFB
	fMEdqb4JvhypXQu6GUYCQxtIk8zpPdh1viNR0vXTgV33G74rBZwTeBnXRZNNvrqxfq46fhJjpx4
	1WE3oz3sjabjrh4YDCM41ePEgPqgmC8abIewqCDV3rA3HReMXWUgcKUssENuT4sgltgM3sg5WZ4
	WE6qpWdIngBlLSH8c5zt3dNq6LiZEIBHngEHeJoxv0MlWVyW54PV/tgbyZzX8CxSgq44d3jRTLp
	+D5fxspaNaRaZN9WU8bMv5i6RRZA1FXIEZlYJZpEVxNxTl7lbEYXlvEVSVIkwl9c1hJWRxsD7a2
	fU6vf1hWrJhdDLTWHs2t0L+wI1/Zu1E+Hz4u81UNMNGbDnefCN6tT8sYbKiARjoMXxsQfUrRcMh
	liZhxdgGJTcx3xZM3NL794flPAbmWN6QgF2CMgcnj+4HiOihqRnwzyaw==
X-Received: by 2002:a17:903:3885:b0:2c2:27be:39a9 with SMTP id d9443c01a7336-2c227be3b30mr199425095ad.9.1781017111918;
        Tue, 09 Jun 2026 07:58:31 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:3::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f87920sm219844645ad.24.2026.06.09.07.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:58:31 -0700 (PDT)
Date: Tue, 9 Jun 2026 07:58:29 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 2/4] udmabuf: emit one sg entry per pinned folio
Message-ID: <aigqFQWzPkiSh3ie@devvm29614.prn0.facebook.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
 <20260603-tcpdm-large-niovs-v1-2-f37a4ac6726c@meta.com>
 <bdce2488-fe77-4f36-9ed6-dd2c785fa7c1@amd.com>
 <aiMY8CpckM8Jav0g@devvm29614.prn0.facebook.com>
 <0c86f5d3-b5e9-4cac-aa9d-30c5c8ecca66@amd.com>
 <CAKB00G3opAoAYswsq2uz0Q6jgku8u4NthKOzCbSumZ0qK7QxcQ@mail.gmail.com>
 <a51e97bd-39dc-492f-bd7d-f137423277df@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a51e97bd-39dc-492f-bd7d-f137423277df@amd.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64310-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,devvm29614.prn0.facebook.com:mid,amd.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C316661BB3

On Mon, Jun 08, 2026 at 03:59:04PM +0200, Christian König wrote:
> On 6/8/26 15:55, Bobby Eshleman wrote:
> > 
> > On Sun, Jun 7, 2026 at 11:42 PM Christian König <christian.koenig@amd.com <mailto:christian.koenig@amd.com>> wrote:
> > 
> >     On 6/5/26 20:44, Bobby Eshleman wrote:
> >     > On Fri, Jun 05, 2026 at 11:30:07AM +0200, Christian König wrote:
> >     >> On 6/4/26 02:42, Bobby Eshleman wrote:
> >     >>> From: Bobby Eshleman <bobbyeshleman@meta.com <mailto:bobbyeshleman@meta.com>>
> >     >>>
> >     >>> get_sg_table() emitted one PAGE_SIZE sg entry per page even when the
> >     >>> underlying folio was larger.
> >     >>>
> >     >>> Instead, walk folios[] and emit one sg entry per folio. When folios
> >     >>> represent large pages (as is for MFD_HUGETLB), each sg entry is a large
> >     >>> page. Normal PAGE_SIZE sg tables are unchanged.
> >     >>>
> >     >>> Required by net/core/devmem to support rx-buf-size > PAGE_SIZE with
> >     >>> udmabuf.
> >     >>
> >     >> That doesn't explain why this is required.
> >     >
> >     > Sure, can definitely add. Devmem currently requires dmabuf sg entries to
> >     > be length and size aligned when it allocates niovs for NIC page pools.
> >     > Though udmabuf is not violating any dmabuf contract by emitting
> >     > PAGE_SIZE entries and the above restriction is probably more a
> >     > shortfalling of devmem, by emitting a single entry per folio this patch
> >     > allows udmabuf to be used by devmem for large pages.
> >     >
> >     >>
> >     >> Please note that accessing the pages/folio of an sg-table returned by DMA-buf is illegal and strictly forbidden!
> >     >>
> >     >> Regards,
> >     >> Christian.
> >     >
> >     > It seems both devmem and io_uring zcrx at least introspect through to
> >     > the sg-table to build NIC page pools (not accessing the memory itself,
> >     > however). Is there a better way?
> > 
> >     That's an absolute NO-GO! We need to stop that immediately.
> > 
> >     Touching the underlying struct page of an DMA-buf exported sg-table is strictly forbidden.
> > 
> >     We even have code to wrap the sg_table and hide the struct pages on debug builds to catch those issues, see function dma_buf_wrap_sg_table().
> > 
> >     My last status is that the NIC page pools are build directly from the DMA addresses exposed by the sg_table.
> > 
> >     Was there any change I'm not aware of?
> > 
> >     Regards,
> >     Christian.
> > 
> > 
> > Oh no change, your mental model is still current.
> > They just go through each sg and use sg_dma_address() on each.
> 
> Ah, thanks! That was a near heart attack :D
> 
> Yeah that is perfectly correct, question is do you then still really need this udmabuf change? I mean the DMA API usually merges together contiguous DMA addresses.
> 
> Regards,
> Christian.
> 

Hey Christian, sorry for the delay I justed want to double check what
I'm seeing...

I reverted the udmabuf patch and confirmed devmem still runs into 4K
pages even for hugepage udmabuf. I see that the dma_map_direct() path is
being taken, which if I am reading the code correctly results in the
sg_dma_len(sg) inheriting sg->length directly (set by udmabuf's
sg_set_folio(..., PAGE_SIZE) call), compared to the iommu_dma_map_phys()
path which looks like it does merge when possible.

Best,
Bobby

