Return-Path: <linux-media+bounces-36348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0014FAEE9FA
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 00:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6671F173005
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DA7242D6D;
	Mon, 30 Jun 2025 22:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VL40OHNc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C58A23AE60;
	Mon, 30 Jun 2025 22:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751321300; cv=none; b=SezQ2uay7XeJlzgGreqgDAdvyRS5pN9rY+TznoEoUwqD+QJ8oGj8151qWDvGegyua3AVmkaUs4/GrehbMlGOxoD0hkUXsunUQRmTtZgeRzg14SCgOaHTKwXEJmRntaxnYBY4y+w14QUGAEI1BdapDOd6hVU82v1EtqXqoWFbusk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751321300; c=relaxed/simple;
	bh=mAQuo7UGn82GJOtu/IIlK8rtii7eZp/rjMYxtF0PlYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YchX8g5igzKJbFuI5Yj++/50S+EbpKhgT3skKj6Nyf7Raf4ygAojH/cn/i4cgPDk3qSW9eHJrMQVYtShWdgxa1BM1TCy2y84e/qWqpmry+/399iqT9pw9TvDfJOIWEYSCpeLDqVCvWf+sp23ENrbNDGja3ZyIFqmpM3mpWjUIHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VL40OHNc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EC6C4CEE3;
	Mon, 30 Jun 2025 22:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751321300;
	bh=mAQuo7UGn82GJOtu/IIlK8rtii7eZp/rjMYxtF0PlYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VL40OHNcHDMLwYYUsY2v5Qf34MWJ2qc3/xqc8W7+CYsEAQuvGlYMWL/UBQf3XrjNp
	 2RFl4J6/UHJjv+UDpUP15FdaWVRR9DrZM9bw4RCNxASw39j2oHb7gYmMIy7wmdXH6W
	 cAenUfvZbee+1eZwdnoC0yOLPK1XyECYfbyUXe3XDTH5PZvvr+ozzRg7QzYe0V+E+W
	 Y1QcFnz5FvLE7wto2a94+fkKlRVZF6QRbz4u/R1w4kWElRaHd8/LXFoOXtXclnhlWr
	 cKohaBfzb3y93X+XHhgMWM8sxFW9WzcYgcbbGuSnUnVNJLuXE5z6Q5mzhxtrxgSehM
	 HjGECpIUzPddw==
Date: Mon, 30 Jun 2025 17:08:19 -0500
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	Jared Kangas <jkangas@redhat.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 1/2] dt-bindings: reserved-memory: Introduce
 carved-out memory region binding
Message-ID: <20250630220819.GA3454648-robh@kernel.org>
References: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
 <20250617-dma-buf-ecc-heap-v5-1-0abdc5863a4f@kernel.org>
 <20250627193132.GB4032621-robh@kernel.org>
 <20250630-attentive-fortunate-turaco-2e36d2@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630-attentive-fortunate-turaco-2e36d2@houat>

On Mon, Jun 30, 2025 at 06:41:38PM +0200, Maxime Ripard wrote:
> Hi Rob,
> 
> On Fri, Jun 27, 2025 at 02:31:32PM -0500, Rob Herring wrote:
> > On Tue, Jun 17, 2025 at 02:25:40PM +0200, Maxime Ripard wrote:
> > > Some parts of the memory can be dedicated to specific purposes and
> > > exposed as a dedicated memory allocator.
> > > 
> > > This is especially useful if that particular region has a particular
> > > properties the rest of the memory doesn't have. For example, some
> > > platforms have their entire RAM covered by ECC but for a small area
> > > meant to be used by applications that don't need ECC, and its associated
> > > overhead.
> > > 
> > > Let's introduce a binding to describe such a region and allow the OS to
> > > create a dedicated memory allocator for it.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  .../bindings/reserved-memory/carved-out.yaml       | 49 ++++++++++++++++++++++
> > >  1 file changed, 49 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml b/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..9ab5d1ebd9ebd9111b7c064fabe1c45e752da83b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/reserved-memory/carved-out.yaml
> > > @@ -0,0 +1,49 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/reserved-memory/carved-out.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Carved-out Memory Region
> > > +
> > > +description: |
> > 
> > Don't need '|'.
> > 
> > > +  Specifies that the reserved memory region has been carved out of the
> > > +  main memory allocator, and is intended to be used by the OS as a
> > > +  dedicated memory allocator.
> > 
> > Other than the commit msg, it is completely lost that this is for 
> > ECC-less memory.
> 
> Because it's not. One of the first feedback I got was that the way to
> identify what a heap provides was the heap name.
> 
> So, as far as the binding go, a heap just exposes a chunk of memory the
> memory allocator wouldn't use. The actual semantics of that chunk of
> memory don't matter.

But they do because you use one carve out for one thing and another 
carve out for another purpose and they probably aren't interchangeable.
For the most part, everything in /reserved-memory is a carve out from 
regular memory though we failed to enforce that.

> > This description applies to CMA area as well. So what's the difference?
> 
> Yeah, I kind of agree, which is why I initially started with a property,
> and you then asked for a compatible.

My issues with properties is we have to support N factorial cases for 
combinations of N properties. It's already fragile. Whereas a compatible 
is (hopefully) well defined as to what's needed and is only 1 more case 
to support.

Rob

