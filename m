Return-Path: <linux-media+bounces-55164-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPP1OVAjsGlhgQIAu9opvQ
	(envelope-from <linux-media+bounces-55164-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:57:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E17251152
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 14:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C18CF34F0321
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 13:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1743AC0F9;
	Tue, 10 Mar 2026 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="RpDvagID"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C0340DFB7
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147597; cv=none; b=Ym4HKCNdFDxlBia56X/7e/7yoTKhwlKk3SVNp8jHlcx09A4vRuBm8fs/6T85iyOO4JlyL3uzl6gEaT6C1wmKc9f0YxFYmv8WnxW+0NGlghOxwhvx2qAXRdNHZaqsBkVGYtP2p9mf8OjuYnyrRSoTM42ctzZOHzIg7Iv/YRK8bq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147597; c=relaxed/simple;
	bh=3UGUinuS6z74FnlW/enJsl9vdYzSblWN+wh7FtvY4QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlzfsIaz08VqIens/X7H86C84wv24QLQDGjhdQxLwkihn+XIi4anNsvEgQxCvyX1ypZQ5n++WEKiTG7NMaoFyL1ybzuOTfp7ofPtOHpYT4m0JyCCFaAWzFaJrvfHfEy7nCo6WkRVLbIwjBPxLuIFTbiyrXSGd8g3Kpg4mbhShfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=RpDvagID; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50917e02532so28683891cf.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 05:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773147595; x=1773752395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IdfZ1gAzWMaWG4bFpHCyz70rMMacJ2An+it0IXdc3OE=;
        b=RpDvagID2grgSvjxLfp7lMOA+5FKkif/zGOEtM30qMWwzBjL0EpoSrBw6JAbYH5fiM
         CakFoI7aA3nHCgwQJNqjCkfRMTsuXTDaYGm2OlOrTN5995McTfGPIt3Naact7Jt860xw
         F27JWJo1LTYlrft65McVAWv5DDBjCkDaeINHNB1q+GuQ7Bi4acUEsBWTdnBduKR9J1nb
         J7O1Q6NKvyqIPeQ4qwlhDkyHd8DdCxwpKs4yu5x6YmT6wSrCcs3JujTp75zjLxnw512H
         5wY/koMbK2zQzbZ05NH32DKMRKGvkyX2C+SOfI6Y6lnjSH8/O4bSB1wPXbyAuQhgzqPu
         1ijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147595; x=1773752395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdfZ1gAzWMaWG4bFpHCyz70rMMacJ2An+it0IXdc3OE=;
        b=iUSyfY1Z5ASOtsN5IhiRWVe1+Z7TBW2DcKPj3urceZoUvr/l7s5IV7I7s1+K4joAR1
         w61FaWxn8QRytF8njOkohT4nuxAbdVEYU3fGyUU60Bb04yutHGZPeZMz0wevxCyuNpAN
         thtudAO35V/0Xao6pBd2Y7pq4I2rIrCM6OzuzpRTYiKnoY2W8p9GRFIrot8JWeTsD04v
         FsqRW8/0dSOtgnxZ3A8qaaoPvshDGLCSvEtRDsUewmH4OPwd+MQ6gljmzoAi53bv80wI
         G8nT0v+n1EcSCspOUvCAtt90dAfoA1QEWIQp63ihQyrM9/fMwN5D8Szs+i4gqFm4SzSr
         MTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDdOTjjvOj8xrfIFq+VsJrXUrR+DyxaRUXLnPETDECiu9NqAjWpxxf1xXvPHqtdS7XdPa7Ddwd9lV2EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyEiSFVFxaxgTIehG52UfG5vuOnChjX305NrJ9cr90KmtspNSv
	aiU6CBCUEh5hX2NMEYaZiVDWESZEBnvJpEQBdPdDQbeA+tpHPDXk75oMvW7TB3/Fn1c=
X-Gm-Gg: ATEYQzwaepLrLdEWx0lXmKfEmuLJ3wNvoM7EclUrO+ThgKkcgwVKSPnXHpnXrIVoUhp
	qr8RvpfcIL4r4RokIsQ11tkPdyeYvPOmbBGzWe6e3ckvC3acjbGqfVQsAyZdkLH5UWnRcQKVDDE
	AmxaXH9S+78qOUK8ZqUzjfrOoupuF7isS7ft7MRVHMSo+hYCFY/EEGBUqEc6DYRyGvQ3FrthLB9
	TtUQZ92vbnO5OrZBgDrWWk8L80qzDcgMyiFTI9pS9HWMh30mT4dlAR7Jx27yPmTqAdiodO9GL9z
	LNNAZKEd0xkWSPE0ND82kIyYsJNY1GsaB3ajEPg28pXfaLh+ar3zkA/yngeiQUqVPDCMQvQIR07
	865viEf0NHZ1YZRlRkzUj1LLFOeHaeiRy5QnlDkfvcAqtcxsl9dztULcz5SIncczhMvK3JDvNoT
	IULtbUjfr4L4u2Yxi/Ym+HK3r1WVGonRqbTEJIgshFJkneX2jGo9+oAljQky/i/emFWrqZdpZe4
	eDj5kll
X-Received: by 2002:a05:622a:1aa1:b0:509:1b34:5350 with SMTP id d75a77b69052e-5091b34579dmr86614331cf.27.1773147595190;
        Tue, 10 Mar 2026 05:59:55 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-508fd904d51sm77155411cf.4.2026.03.10.05.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:59:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vzwgj-00000005Uqh-3i7S;
	Tue, 10 Mar 2026 09:59:53 -0300
Date: Tue, 10 Mar 2026 09:59:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Julian Orth <ju.orth@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Deak, Imre" <imre.deak@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thomas Hellstrom <thellstrom@vmware.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH] lib/scatterlist: fix sg_page_count and sg_dma_page_count
Message-ID: <20260310125953.GS1687929@ziepe.ca>
References: <20260308-scatterlist-v1-1-39c4566b0bba@gmail.com>
 <20260308180826.GG1687929@ziepe.ca>
 <CAHijbEX=LN_ntp6zwsqy3sW7EB+E6cBCWnrKZb_RqdNG=Et_3g@mail.gmail.com>
 <IA0PR11MB7185574E3A63285860017D69F846A@IA0PR11MB7185.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185574E3A63285860017D69F846A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Rspamd-Queue-Id: 63E17251152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55164-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux-foundation.org,intel.com,linux.intel.com,vmware.com,vger.kernel.org,redhat.com,linaro.org,amd.com,lists.freedesktop.org,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:dkim,ziepe.ca:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 05:49:23AM +0000, Kasireddy, Vivek wrote:
> There are a couple of reasons why we got rid of the pages array:
> - Back then, there was some confusion about whether a struct page would
>   exist or not for tail pages when HVO is enabled. Regardless, there was also
>   a concern about exposing tail pages outside hugetlb code.

The existing code relies on struct page for the vmap:

        for (pg = 0; pg < ubuf->pagecount; pg++)
                pages[pg] = folio_page(ubuf->folios[pg],
                                       ubuf->offsets[pg] >> PAGE_SHIFT);

Tail pages always exist, they are required by many interfaces.

> - And, we also wanted to prepare for a future where struct page would not
>   exist anymore, so, it made sense to just use folios only.

If you can 100% stick with whole folios then great, but we don't have
the APIs for that cases udmabuf needs right now. Most likely we'd
expect to use phys_addr_t for scatterlist and direct full folio for
vmap. Neither is helped by the datastructure in udmabuf.

Jason

