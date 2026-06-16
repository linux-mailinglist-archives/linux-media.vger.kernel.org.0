Return-Path: <linux-media+bounces-65011-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U1C2ARVFMWoIfwUAu9opvQ
	(envelope-from <linux-media+bounces-65011-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:44:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7089E68F777
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:44:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ziepe.ca header.s=google header.b=LkPMS57S;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65011-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65011-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D019730A20BC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 12:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51663655D6;
	Tue, 16 Jun 2026 12:40:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D4235677C
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 12:40:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613623; cv=none; b=LFh6FGl05HJTBMyEATKKRkMdXelmIotbLC0PAKSkHACS9eX64MuiWeZG22Kc8sLO4SHwCfOXS/rD+EV7bs22QC/nKhHfHK7Sb1zgRFmEWS2iC+tuJYAE7pJsJBl1LcBF78Ts7BxIAvt7ToSQqOB7+g0Sd7DjjTPNH9CsNr0GLOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613623; c=relaxed/simple;
	bh=tPbjX8dfzPLu8onhnfm0DNzfCkJoWXqGLy1Lxvc2NUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dfz08Eh07eiS1LZ0p9w8Opz/5QCQNfKoTcyL+H8cJSkbfG59aHBk+QJIcqO8oJ837iA6JxYdHCir/UFIi7QxnPK8Br+UGIgSDxhrrMuE65eO8Xug2pFi8tfS76LK76La0Dsd2E/1F44uIw9kqYVmZvk6slaKXJW9mH/7XKhl1aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=LkPMS57S; arc=none smtp.client-ip=209.85.160.176
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51778069c31so40309741cf.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 05:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781613621; x=1782218421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tPbjX8dfzPLu8onhnfm0DNzfCkJoWXqGLy1Lxvc2NUs=;
        b=LkPMS57SheHWUiSvnK76MNPuPeTpmepRr/zvfJ4ZpBSaUTrCEOpDnjQIDbl4YV/8pK
         0RvEWX124XtPixmZGL7nu5gP6/f8YLcuJcemmDyc9fyshX/R+SxjdOfeGu82kKdDYZho
         Cd9Pz1ccepPbodA6fjVyV8/JveKyJe3KP8MRwGAwYk9TlUcvrqnzf0p67yRmqK1zFBkn
         ueRtbFdomSo6KVgL++OLAEQDKjcHqEnR+zzX9N0gqBkuWhJN80xWe9ysGRvBjlwR0mH0
         ufusAQb6vCoO1JcuHxGMggFcSZTI3SlLFb/IbD7/qTV/l7St0K9Px/RxVE6ka7P8+N04
         W1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613621; x=1782218421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPbjX8dfzPLu8onhnfm0DNzfCkJoWXqGLy1Lxvc2NUs=;
        b=FPNGfzT0Z/MIoupI9GrABIbHn77TBZqaZkb/xKWN/XjievYyIE0vRSORryF+yGZ7T1
         JyQDlPndwMgD9NluuVWjJRc/KVR1fMVaLF4vLCWRI5B8yG0BPDn32gmzIpPlcfk1eCpL
         +WRUepP94ipnvRyIjewAzgdZ1xoZxwvTTWY9UhmMdyhDY44f8lS9Iy0UPh2elIcKhamA
         z1pa33CIyKOwjpRTqfEpQu9i6bZU6O3qSbcabjqZi05ZF93iZhUbEYGFdYzVD+KusVyf
         6z9NtlG7Of+BsxjQfHIA6mCi/sF0CxR/AHPvm7hga8t9DLgcUVjsCXa9HisGRc4lSsZ8
         mEkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OIE29NpppnS97hVm5d+EOqQXDExkcEeUhRh0gvYgvH/Th+XlS9zzXqFP4C5Of7SX4vV5Mgno7Mp6Xaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcNrI821uQihi0cZuO+ZqEqtws4tu5PoatqJQZwEEG1s0IkgIt
	Rp1VFFLRcmqxynFkRlJBfEe69HvE6S1/7JqimbUsb/YoAdmavL505A1nNgFkfkUtEK8=
X-Gm-Gg: Acq92OFHW3DghsCwTdCIV/u4ejtOYZBiA0NTDJSTmTWbMVjOTrQ9zn08KZcEE8H+4sA
	X2flqGFkAj/LTgGjYDHyftJHMgzvRICa8WhEYIEqGVPURL87AalGm0RJWO6GwQY+WLR85oizPV1
	F9VRROAUo6mlnjEsbr5Td8bVd8dwnc3MBbU7UKMbX3rsY7xpGp6p66TbNA5MYJbToLe0pCB1S1/
	AbYj3biF4Q02eLFy2JEbf/C2SFr9S6oi6KyC0amnTh+pSQTMXgkBAr5m/HdDxZi4njsj3UlUwF1
	4uqfyYPrMYU/D68EOVe1EdUqk7xoPiKx498UP7wq+5JTDCvTy1+QL86eiyzLHXPIinLLRE15p/t
	ydzli0s0wx2GlLJ07VyZcLGclRhKivJqUCPwRBpdR8n0BpeuzdRZdAB5ptdyugz0INirEdia3Vu
	O2cRMYG7snxPfdKmy1URpCnJvy6/DArv33E6PPL8OrVTzxJAO5RNgtRcFcPj+3GViY29da+i29c
	8ITsQ==
X-Received: by 2002:a05:622a:2282:b0:517:6804:1fb3 with SMTP id d75a77b69052e-517fe230d82mr282972431cf.18.1781613620607;
        Tue, 16 Jun 2026 05:40:20 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb61d948sm133785221cf.1.2026.06.16.05.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:40:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wZT5X-0000000Fzb5-0uZr;
	Tue, 16 Jun 2026 09:40:19 -0300
Date: Tue, 16 Jun 2026 09:40:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"sdf@fomichev.me" <sdf@fomichev.me>,
	"razor@blackwall.org" <razor@blackwall.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"almasrymina@google.com" <almasrymina@google.com>,
	"matttbe@kernel.org" <matttbe@kernel.org>,
	"skhawaja@google.com" <skhawaja@google.com>,
	"dw@davidwei.uk" <dw@davidwei.uk>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v2 2/4] udmabuf: emit one sg entry per pinned
 folio
Message-ID: <20260616124019.GA3577091@ziepe.ca>
References: <20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com>
 <20260611-tcpdm-large-niovs-v2-2-ee2bf15e7523@meta.com>
 <IA0PR11MB71852246277F773AC41DAAA3F8E52@IA0PR11MB7185.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB71852246277F773AC41DAAA3F8E52@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65011-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vivek.kasireddy@intel.com,m:bobbyeshleman@gmail.com,m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,linaro.org,amd.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,fomichev.me,blackwall.org,iogearbox.net,davidwei.uk,meta.com];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ziepe.ca:dkim,ziepe.ca:mid,ziepe.ca:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7089E68F777

On Tue, Jun 16, 2026 at 06:04:03AM +0000, Kasireddy, Vivek wrote:

> > This is helpful for importers like net/core/devmem that expect dmabuf sg
> IMO, udmabuf needs to detect whether importers can handle segments that
> are > PAGE_SIZE and set the entries appropriately. Please look into how the
> GPU drivers and other dmabuf exporters/importers handle this situation, so
> that we can adopt best practices to address this issue.

Importers have to handle arbitary scatterlists, devmem is just broken
if it can't handle the output of sg_alloc_table_from_pages().

Jason

