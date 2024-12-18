Return-Path: <linux-media+bounces-23706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E737C9F6625
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 13:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1517316A8C9
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 12:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901CE1ACEBD;
	Wed, 18 Dec 2024 12:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="Sz5HZNMG"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E32B1A3029;
	Wed, 18 Dec 2024 12:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525940; cv=pass; b=KOiimod/QRTq4BigmQFHs4yS4nGK3v56Ct9WpO0f+VuhX9RBGdtFB4rZMdQDP47zKKDQWFtkj/gOCci674Wv1u+9jK8jLF0uFFVbDeCj7ljKxMcMbpapxbnotz35n1cUgl/Jc++j8PQ9nalBeXZu1ohgXGfsYgdgBzNKD32FsGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525940; c=relaxed/simple;
	bh=L4zL7d71PMK96x3LI5RhLVF4xwHYRXVC4WsikuBhrtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HViBpAebLrC+xQaRlbQRLFjEW7daTaoocBd2xOwVbtEyK1BzlBrroatueVw06GsiOVWt337T9XDRcoNV/WvWrkG51ikC4080clJgOcB9T5oKgJzPLWyOg7LJ9Eo3xXuxHF9bwy6jDCh24TO7wpzXngnkTgjSBIJOnZr6uxEMONE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=Sz5HZNMG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1734525915; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NWD2o+9Y7XDPF4C1vAR+dBWAxe1uQAAPjQDmSYMjZuU8EC2LfBfIprNY0WKeuCB8oA/8x0xhgzgQiZEF1EywjlzbOX6tsjwfwFpmZWfZwJcetsf+Axi4ygNhAKNdZKZxjM8KpC682HvGTmM/z3uwUBSpk+Tshfbc/lYeeTCoKlM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734525915; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=THeGjzIRoDHBNZCDp/7M2lIPDvqr7tz6+xf8HWPd0n4=; 
	b=NMIyfkCxiWBXCHQIoNTdHM9WwqNkLCtOUBMRM1Z957KqI2yrQKZUsTiOIIHKZn4rH/EolgipegR+Qp7kjxbLVxUG0hkbA8ta8t9ZjLCEedUvmK5Lj89kvV5WyCs/bcG/Da+YdNtgPPniWqukKW4zXx9O8Tomp5R+4/82jwhvPyI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734525915;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=THeGjzIRoDHBNZCDp/7M2lIPDvqr7tz6+xf8HWPd0n4=;
	b=Sz5HZNMGiW2T5vhTYWChnAEcC6+/LOv/e1prcDMIgl61a6yGkAMQD8CpbnsNVXDr
	U5gfTpTrGTC4uK5kaACDmtbe6qgRYTS1ZaksAj9Wj/Dlp0Fh6LithWY39WtMMIvRSTx
	MaTa023XAbsU56IL1zEx7Na8YO/vwsVOLRQcLKAM=
Received: by mx.zohomail.com with SMTPS id 1734525913022316.05488947907077;
	Wed, 18 Dec 2024 04:45:13 -0800 (PST)
Date: Wed, 18 Dec 2024 13:45:05 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: mark
 vdec_vp9_slice_map_counts_eob_coef noinline
Message-ID: <20241218124505.xwgsnpi2rvbngqvs@basti-XPS-13-9310>
References: <20241018151448.3694052-1-arnd@kernel.org>
 <20241118200641.GA768549@thelio-3990X>
 <20241119110226.dbd54clp46klvjl5@basti-XPS-13-9310>
 <20241217174628.GA2654633@ax162>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241217174628.GA2654633@ax162>
X-ZohoMailClient: External

Hey Nathan,

On 17.12.2024 10:46, Nathan Chancellor wrote:
>Hi Sebastian,
>
>On Tue, Nov 19, 2024 at 12:02:26PM +0100, Sebastian Fricke wrote:
>> Hey Nathan,
>>
>> On 18.11.2024 13:06, Nathan Chancellor wrote:
>> > On Fri, Oct 18, 2024 at 03:14:42PM +0000, Arnd Bergmann wrote:
>> > > From: Arnd Bergmann <arnd@arndb.de>
>> > >
>> > > With KASAN enabled, clang fails to optimize the inline version of
>> > > vdec_vp9_slice_map_counts_eob_coef() properly, leading to kilobytes
>> > > of temporary values spilled to the stack:
>> > >
>> > > drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:1526:12: error: stack frame size (2160) exceeds limit (2048) in 'vdec_vp9_slice_update_prob' [-Werror,-Wframe-larger-than]
>> > >
>> > > This seems to affect all versions of clang including the latest (clang-20),
>> > > but the degree of stack overhead is different per release.
>> > >
>> > > Marking the function as noinline_for_stack is harmless here and avoids
>> > > the problem completely.
>> > >
>> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> >
>> > Unfortunately, I have seen no moment on my upstream report and this
>> > warning is breaking allmodconfig builds because of -Werror. Can this be
>> > applied as a workaround for now (preferrably with a Cc: stable on it)?
>> >
>> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>>
>> I'll handle it asap, it will be part of 6.13
>
>Is there any update here? I don't see this patch applied in -next.

I have sent out the PR and it has been applied to the -fixes branch in
the media tree, due to the holiday period there might be some delays but
I expect the change to soon land in Linux-next.

>
>Cheers,
>Nathan

Regards,
Sebastian

>
>> > > ---
>> > > I have not come to a conclusion on how exactly clang fails to do this
>> > > right, but can provide the .config and/or preprocessed source files
>> > > and command line if we think this should be fixed in clang.
>> > > ---
>> > >  .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c         | 3 ++-
>> > >  1 file changed, 2 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>> > > index eea709d93820..47c302745c1d 100644
>> > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>> > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>> > > @@ -1188,7 +1188,8 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
>> > >  	return ret;
>> > >  }
>> > >
>> > > -static
>> > > +/* clang stack usage explodes if this is inlined */
>> > > +static noinline_for_stack
>> > >  void vdec_vp9_slice_map_counts_eob_coef(unsigned int i, unsigned int j, unsigned int k,
>> > >  					struct vdec_vp9_slice_frame_counts *counts,
>> > >  					struct v4l2_vp9_frame_symbol_counts *counts_helper)
>> > > --
>> > > 2.39.5
>> > >
>> >
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

