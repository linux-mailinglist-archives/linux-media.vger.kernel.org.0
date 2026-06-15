Return-Path: <linux-media+bounces-64924-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id olEoHtc+MGp5QQUAu9opvQ
	(envelope-from <linux-media+bounces-64924-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 20:05:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C03AE6890A6
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 20:05:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=jKn5+DbH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64924-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64924-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D625830DA873
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 18:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856D130569B;
	Mon, 15 Jun 2026 18:04:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558F919F11B;
	Mon, 15 Jun 2026 18:04:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546664; cv=none; b=Tn6fQHxDh89JAvApB0PdfpIH1LgVv3wNGPh/teyNwwdg7lFVx2gskefTM8aYFbIFEa4fjpCTrKcIUPi92SqCaT8eeA/zoje1uA85ZhjcYHr3QtGagh/49re1eja4Tz6Q1q426XxCwcWyxcuFtTh4kI+oSrBkZQHoplUbNgbwpE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546664; c=relaxed/simple;
	bh=1dpE/3mwZSx4soKYT+PKYqX9IQJOVGASuUS80uYLXPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FlzOO1j3Pc1dPy4bUNzHsz46P1D/mSh0khAyOsQ6LVSPnuC5qh6d0I+bOQPKcNrRWYgJq5i13C1YryU/k7m3GJzS/iw23/GrGa9HsDVgJjJ+Hz9AROB3VCgN7TKrZwhIsHEr1tYlkxbOSd1WAsTyhKUlWrED4y6n0uOQxRw0/rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=jKn5+DbH; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781546658;
	bh=Hx6SLPH67QubJLa+CbT7LpoPHHXCYP1TXeCS4akReO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jKn5+DbH/xnIIUSSNh6WNwpqwAI/JFz0xqpbCQXeQiEGy4171QNF+wi3cDt3U2g5o
	 x3DaXDM1hnoQBBQwB3vR88daGGQMgOmQp4yE/1q+Y+uBaJgdoiqOFD3IVlCntlCvhB
	 nHWUaQPDmys6J8RTfGJ83ZE013T2w9douJB0OIJbtLIpwmkQlrjCTMEP+DeF+ovkj5
	 Cib22QI5fpBQ5j+fkFdcCZZw3bzvOVTBIf2tdQaoOtxpB74iq6tBi0QqjTEXz2KiHP
	 w40N5qBImD2bizUSdF/9YgVd4hHdJR4RvytxwgZNx9FZmKiBQDj3OAxEMqOYjSZGwV
	 L++hZZHftCU4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gfJ0V0ggTz4wM3;
	Tue, 16 Jun 2026 04:04:09 +1000 (AEST)
Message-ID: <4d75b948-3b74-4970-97f2-72e54f9c9694@ozlabs.org>
Date: Mon, 15 Jun 2026 19:04:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] vfio/pci: Add a helper to look up PFNs for DMABUFs
Content-Language: en-GB
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Ankit Agrawal <ankita@nvidia.com>,
 Pranjal Shrivastava <praan@google.com>, Alistair Popple
 <apopple@nvidia.com>, "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20260610154327.37758-1-matt@ozlabs.org>
 <20260610154327.37758-3-matt@ozlabs.org>
 <DM6PR11MB369091A6F1E32054A95AB6788C182@DM6PR11MB3690.namprd11.prod.outlook.com>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <DM6PR11MB369091A6F1E32054A95AB6788C182@DM6PR11MB3690.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64924-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kevin.tian@intel.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ozlabs.org:dkim,ozlabs.org:email,ozlabs.org:mid,ozlabs.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C03AE6890A6

Hi Kevin,

On 12/06/2026 09:42, Tian, Kevin wrote:
>> From: Matt Evans <matt@ozlabs.org>
>> Sent: Wednesday, June 10, 2026 11:43 PM
>>
>> +int vfio_pci_dma_buf_find_pfn(struct vfio_pci_dma_buf *priv,
>> +			      struct vm_area_struct *vma,
>> +			      unsigned long address,
>> +			      unsigned int order,
>> +			      unsigned long *out_pfn)
>> +{
>> +	/*
>> +	 * Given a VMA (start, end, pgoffs) and a fault address,
>> +	 * search the corresponding DMABUF's phys_vec[] to find the
>> +	 * range representing the address's offset into the VMA, and
>> +	 * its PFN.
>> +	 *
>> +	 * The phys_vec[] ranges represent contiguous spans of VAs
>> +	 * upwards from the buffer offset 0; the actual PFNs might be
>> +	 * in any order, overlap/alias, etc.  Calculate an offset of
>> +	 * the desired page given VMA start/pgoff and address, then
>> +	 * search upwards from 0 to find which span contains it.
>> +	 *
>> +	 * On success, a valid PFN for a page sized by 'order' is
>> +	 * returned into out_pfn.
>> +	 *
>> +	 * Failure occurs if:
>> +	 * - The page would cross the edge of the VMA
>> +	 * - The page isn't entirely contained within a range
>> +	 * - We find a range, but the final PFN isn't aligned to the
>> +	 *   requested order.
>> +	 *
>> +	 * (Upon failure, the caller is expected to try again with a
>> +	 * smaller order; the tests above will always succeed for
>> +	 * order=0 as the limit case.)
>> +	 *
>> +	 * It's suboptimal if DMABUFs are created with neigbouring
> 
> s/neigbouring/neighboring/

Ah, not a typo. :)  That is en_GB and AFAIK is permitted.

>> +	 * ranges that are physically contiguous, since hugepages
>> +	 * can't straddle range boundaries.  (The construction of the
>> +	 * ranges vector should merge such ranges.)
> 
> though the field is called 'phys_vec', removing 'vector' in description
> is clearer here.

Fair, reworded.

>> +	 *
>> +	 * Finally, vma_pgoff_adjust is used for a DMABUF representing
>> +	 * a VFIO BAR mmap, which is created from the start of the
>> +	 * offset region.
> 
> Elaborate it a little bit that the vm_pgoff is already counted in paddr
> of phys_vec so it should be skipped when finding the pfn.

OK!  Expanded this paragraph slightly to explain that vma_pgoff_adjust
avoids double-accounting, and that a BAR mmap() DMABUF is created such
that the start of the VMA (even with an offset) equals the start of the
DMABUF and equals the start of the physical range.

>> +	 */
>> +
>> +	const unsigned long pagesize = PAGE_SIZE << order;
>> +	unsigned long vma_off = ((vma->vm_pgoff - priv->vma_pgoff_adjust)
>> <<
>> +				 PAGE_SHIFT) & VFIO_PCI_OFFSET_MASK;
>> +	unsigned long rounded_page_addr = ALIGN_DOWN(address,
>> pagesize);
>> +	unsigned long rounded_page_end = rounded_page_addr + pagesize;
>> +	unsigned long page_buf_offset;
>> +	unsigned long page_buf_offset_end;
> 
> what about "fault_offset[_end]"? page_buf is a bit confusing.

I went round several times with these names, thanks for the input.  Just
tried it out and your suggestion is clearer.

>> +	unsigned long range_buf_offset = 0;
> 
> could this be called 'range_start' then the 'range_start' in latter loop
> is renamed to 'phys_start'?
> 
> Not strong... just feel such naming helps me understand the logic easier

Anything that helps helps, thanks.  I ended up renaming this to
range_start_offset (as offset is IMHO important).

I'm a fan of diagrams but this is too large to include in a comment.
But for posterity on the list, and using the new names, an illustration
of a DMABUF with 3 ranges in phys_vec, where a mapping's
faulting page offset lies in range [1]:

                               fault_addr--+
                                           v                   VMA
                    +-----------------+----------+-----------------+
                    |                 | Faulting |                 |
                    |                 | (hg)page |                 |
                    |                 |          |                 |
 |---- vma_off ---->+-----------------+----------+-----------------+
 |                                    .          .
 |                                    .          .
 |--------- fault_offset ------------>.          .             DMABUF
 +-------------------------+---------------------------+--------------+
 | phys_vec[0]             | phys_vec[1]         .     | phys_vec[2]  |
 |    .paddr               |          .          .     |              |
 |    .len                 |          .          .     |              |
 +-------------------------+---------------------------+--------------+
 0                         :          .          .     :              L
 |-- range_start_offset -->:          .          .  -->: range_len
                           :          .          .     :
                           V          .          .     :
                           +----------+----------+-----+
                           |.paddr    | PFN      |     |
                           |          |          |     |
                           |          |          |     |
                           +----------+----------+-----+
                                      P

 P = paddr + (fault_offset - range_start_offset)
 L = sum(phys_vec[0...2].len)

>> +	unsigned int i;
>> +
>> +	if (rounded_page_addr < vma->vm_start || rounded_page_end >
>> vma->vm_end) {
>> +		if (order > 0)
>> +			return -EAGAIN;
>> +
>> +		/* A fault address outside of the VMA is absurd. */
>> +		WARN(1, "Fault addr 0x%lx outside VMA 0x%lx-0x%lx\n",
>> +		     address, vma->vm_start, vma->vm_end);
>> +		return -EFAULT;
>> +	}
>> +
>> +	/*
>> +	 * page_buff_offset[_end] is the span of DMABUF offsets
>> +	 * corresponding to the faulting page:
>> +	 */
> 
> if the naming is kept then s/page_buff_offset/page_buf_offset/
> 
> otherwise,
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Thank you,


Matt



