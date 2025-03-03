Return-Path: <linux-media+bounces-27400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA3EA4C6D9
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AA0116CBF5
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAEB21883F;
	Mon,  3 Mar 2025 16:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDDUocmB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B67521516C
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018383; cv=none; b=i2mBKiwk8MNVVBn2ql8CqJO4bvMpVLjJ2JQGj5mOiDkYnf8m4QLBe4Nz8MRQWsrRnjtOm67MylYbeVA3k6E74o8naUv12i4BIj/t2hw8jvFRVjEM2rkByiKuCw8HY1XpvE7sUtBw0x/tcO++QtLKTY+HQpCzKwC7KoT+TgBZWH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018383; c=relaxed/simple;
	bh=4xHFdQ1Y5+HdSBKXFWdMkqvpT+451c6q0oKzKQfQ2Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NsyMF5T2hnSZo38F/4CeT7fgkh742YrtoI1PfZgr0sW1hkgVrNpd45rowLok56jp7OjZHrixFY4o3dmAkSjEDmkHSKNEP0BsEbD/t2ym92pAzuC/GimPFTkmfZ6uxygpiU2Ak0g5nOgAEw8FIUGF6X8v+Ohz+u9bXX9uKZImbRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDDUocmB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F603C4CEE6;
	Mon,  3 Mar 2025 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741018383;
	bh=4xHFdQ1Y5+HdSBKXFWdMkqvpT+451c6q0oKzKQfQ2Fk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=pDDUocmBKcoPPSN9aPKDJlvVAf9cghbzVAmo4cAn6LGczbHsrgD4y0KEzK1RsT11c
	 qNMsFjo6XUpS8k4bZ//Dh/Fcb8GdP54hcDuHSjtAm43yTLbVH9CKo3H8Ps++SGUOSt
	 tG5VHo4hpT/THzvY2/U4dZ3n7GsezfPIs6zKg7vBBTU1nO94F9+JCKyNPTQ+DzoNcu
	 7nl66VPR0ZHRejdYFZim29x70GNHOPG7XOzpqWfY7w2ECzazCjAW1w+4238QXhTaP6
	 33RLGfOJ5zd71rYygUsIzXlkohr4DJ/K7I+RN0qxhAMhT97P4BUBluOhS3Pv8bIZK2
	 WCfRX+rs7uhvg==
Date: Mon, 3 Mar 2025 10:13:01 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	hdegoede@redhat.com, hans@hansg.org,
	stanislaw.gruszka@linux.intel.com, jerry.w.hu@intel.com,
	tian.shu.qiu@intel.com, daxing.li@intel.com, hao.yao@intel.com,
	bingbu.cao@linux.intel.com
Subject: Re: [RFC PATCH 3/7] media: ipu7: add IPU7 DMA APIs and MMU mapping
Message-ID: <20250303161301.GA168226@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221075252.3347582-4-bingbu.cao@intel.com>

On Fri, Feb 21, 2025 at 03:52:48PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> The Intel IPU7 has internal microproccessor which runs the firmware
> The microprocessor access system DRAM by its internal 32-bit virtual
> address space. Driver should setup the MMU table and expose the DMA
> APIs for memory buffer mapping.

s/microproccessor/microprocessor/
s/access/accesses/

> +#define ISP_PAGE_SHIFT		12
> +#define ISP_PAGE_SIZE		BIT(ISP_PAGE_SHIFT)
> +#define ISP_PAGE_MASK		(~(ISP_PAGE_SIZE - 1))
> +
> +#define ISP_L1PT_SHIFT		22
> +#define ISP_L1PT_MASK		(~((1U << ISP_L1PT_SHIFT) - 1))
> +
> +#define ISP_L2PT_SHIFT		12
> +#define ISP_L2PT_MASK		(~(ISP_L1PT_MASK | (~(ISP_PAGE_MASK))))
> +
> +#define ISP_L1PT_PTES		1024
> +#define ISP_L2PT_PTES		1024
> +
> +#define ISP_PADDR_SHIFT		12

If you used GENMASK(), FIELD_PREP(), FIELD_GET(), you wouldn't need
these _SHIFT #defines.

