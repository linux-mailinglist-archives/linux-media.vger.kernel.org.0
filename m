Return-Path: <linux-media+bounces-57801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMlMLaPoy2myMQYAu9opvQ
	(envelope-from <linux-media+bounces-57801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 17:30:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C33736BB31
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 17:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B76F3184BF7
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 15:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817AE3F9F59;
	Tue, 31 Mar 2026 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="NgpBhtFm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981043E3DA8
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 15:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774970666; cv=pass; b=tf4vvjny3dq91XqgrZnRX2moUt1IqbN+7/p/iSUVpFSWmbDGoZ1gE1a79u591I8cRXgbCafdRZBttcjFfxFSZKZAQgxwPcsDZFzVdX+zfhUFpGW7ZO1jdVeUYRu2PNfJCF7N2n5QGBySyA3aDuIXxa6uTjDbK+ijvkGhW5bp8xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774970666; c=relaxed/simple;
	bh=rVzD9RZ8DOj+OZScnURt3JaaKOoh5Y6w5keNNJrEDEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fp73X3Fkc5YcJ9keqxATiwwXskIdm9ezvcFVAkL+gtwz7laME6Q/EfecUmtwXZrBvlW4TQ/jXZZZPhLbfnKvqlyHVr8JYOkL2ZMlHkut9/aN66rsUqCwNYYQDFm+9qod7RlSEhBYxV+CmMhtx082/fR6Cnot4mspDZ8VTBThTc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=NgpBhtFm; arc=pass smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 62UM0ktW3794434
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 08:24:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=rVzD9RZ8DOj+OZScnURt3JaaKOoh5Y6w5keNNJrEDEk=; b=NgpBhtFmItDM
	CNbcwb/E9DkdCKHJ/+HXG5nYnUCSAGdnK0J1DywzsfubqT3zoyDOiorROwlve6f5
	Fabj2p7OS4l9/vDda/nt1iaWFhmj/dD7ikbmlCSU9C3dxHoD/BW1829WKG1gSNUo
	bvhspgCJNM7QlFoJ6rz3LBSz57IF68o48IZ5V4B4vXaE0cFVG0Wx1twzhAphguZA
	x2QO4KynACOL7v8zMEgjTg34ybae8h4kqqcSIVWunaNwvXNvzVjB0rqBMikZSh7r
	g5YEFzd1SPUtzJOBJK+aZ0ehLdWWfxZnd/kXQFeHL1MALxrPKcsgO9HqIAQQZ7ex
	Zwkn3t7Umw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by m0089730.ppops.net (PPS) with ESMTPS id 4d6xvmdakr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 08:24:23 -0700 (PDT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-40f09403c56so22055667fac.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 08:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774970663; cv=none;
        d=google.com; s=arc-20240605;
        b=YEyk4LrOkxJ2SX+6XFkhc1IRHvRRzML6tPFuKht2X7sOhWSI8Qfsc51zqqEg3R1NuD
         jJJgPPdZ0T7eGwLgkFj80jp/BNyOy1KLWxWssIrs9p2CArvmIr9GJgFzTYgjmuzG+ZGd
         VO4Rrj/VSu9BqneTyejNuRNoCgnkNpEOfdk+GOm8r0dTu2+noPWzF/2G5wotMoAL0UHR
         1OcrNYHVrIhOFJEigsRe3m5xtQk8TLU8x8rL8lGu0Vpnqkuf58PugokRg3xO0GljG2Rf
         OZf5LmBXu2MEDlGOEALkF3lmZPCbNu8QiyoJIB1F313yvG3uXeH32xDFVnPATTLNta1Y
         DNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=rVzD9RZ8DOj+OZScnURt3JaaKOoh5Y6w5keNNJrEDEk=;
        fh=Y2ueoGXpCiYb4M7HDC+XLRuf6alUIVuPniYzN+d09qk=;
        b=e4z+xPMk9AZxhT6Mjn0TO+WArVefuKVkd4U3koOlTd1LnHMvB0wqjHS+bshmm61uEI
         JKWwIxYnsBUch0p/EtpBeV0Mdz9Vwc6pAh7A7MeVrEnba539FSriyEbUT+C/IAVyzlVF
         lL1ASQV/QZg+slyJPCePmm9dBKgsH5/veB6KwvjzhMKfNtAbu3xOxyvhAB+WxazbjOEH
         fA1A+9wEpTU/6PcnpS6erTaoXiVx+Of/PkEDds+W8tWNOpSoyFQWwePzB8ljgBn73vQz
         fU1fEcXW3WT75nBBZV81aZJqZFZtlUcImN7NjPUh1Aur9YoKrzX1JjnvAnyz8N810sEZ
         pFIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774970663; x=1775575463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rVzD9RZ8DOj+OZScnURt3JaaKOoh5Y6w5keNNJrEDEk=;
        b=M8MyOfFQEx5LsuQR0ZzXMoIH9owGbaSrrDRdI5fZ1UKZ/ai8NYr/RrrszNJervgJUC
         216W57fYXtjlldU23iqWvV60PzdKy2yEUQ5kMdVN6VRAJhVRHy7F2P1AlHTY/PL8dyGD
         0tpv4ZdBUKJiYYyuRtlCJwg+er06J5zz4Ex8/tGXKvEPFIetZyh3jmb1n5a22d6BxjZK
         rP49yq3eDZFL9r9bPqT04RgWkhApfJVAUWwswpZsLr/1IYTS/3NylsUUXP3CYpumVmtK
         U0KdkP9singumn+DHtT62Sc6aFbuC3yMiINhcaI2jmX9FHbqJcc1LtVBzg81pcMx/iqC
         YezQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj/kZ0FvIUOoRfg1FY0RBU2Au18lhzacXdgeQz4zcCRWUfyBjsZdYqle+ez0+kBKoL47dTMFddaHTQjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfGmj8NfdUV2LoDPPh0dzy0oihMTF/vvnlX8o3CJ0OIMiI9WKt
	JIAiNxfFnCuQ2QyezFHCYYcewwnzW3XqRlSdxjt1prJ1PWyJ5upagTyn/9W0NuF7fpph1fF6zt5
	V5mGxj92u5vA/5BNxoJY9VlBWs2OUz3tukFxlESgdThbb8vjKZ7Bu1H9GhTfG6+H1Q13FCNvb92
	MWf+URBP9muKWzcyiuy4m8vYDyB144te2a7Y5euw==
X-Gm-Gg: ATEYQzxxZPv5qIBb8vV8BjB07JkFeOYLv9yKNm37yrhXlR+/5yO1Hns8a/yLO/Fth5y
	ZS4ScyvckwolmoYOPqZAVb9a/c5JaPFAEoERT8jrwiuZzgzS4ZRVK6tCt/OwQnzsqWtemZD81lL
	xHJLcuSlepeb7cRhZY7c86s2FifknopOn7pmaOLKu8k8XH5MXZeTvXb/dp2fFJ94iHYhmyFle0U
	MUa
X-Received: by 2002:a05:6820:2901:b0:67f:31e3:81a with SMTP id 006d021491bc7-67f31e31008mr367465eaf.2.1774970662751;
        Tue, 31 Mar 2026 08:24:22 -0700 (PDT)
X-Received: by 2002:a05:6820:2901:b0:67f:31e3:81a with SMTP id
 006d021491bc7-67f31e31008mr367434eaf.2.1774970662327; Tue, 31 Mar 2026
 08:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312184613.3710705-1-mattev@meta.com> <20260312184613.3710705-10-mattev@meta.com>
 <20260330133336.GT310919@nvidia.com>
In-Reply-To: <20260330133336.GT310919@nvidia.com>
From: Matt Evans <mattev@meta.com>
Date: Tue, 31 Mar 2026 16:24:11 +0100
X-Gm-Features: AQROBzBjz_Oa24Ou_FBmQkKdtClzBrzQA9IDx3XIRw5UCOwDpX9lbYyqY3Y5W8c
Message-ID: <CAFzAbJHqnuV2vA-LPQy3xo1KesLUxJOCtS4FigsaZtaZEi19jQ@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 09/10] vfio/pci: Add mmap() attributes to DMABUF feature
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
        Alex Mastro <amastro@fb.com>, Mahmoud Adam <mngyadam@amazon.de>,
        David Matlack <dmatlack@google.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
        Pranjal Shrivastava <praan@google.com>,
        Alistair Popple <apopple@nvidia.com>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0OCBTYWx0ZWRfXzoKp1EoYnTca
 gxAoTsMIUVFs+wHxTvve0L50ujMiOzF/ITDi+WTRC6W2v7TPndQCgWki4QcPB+msOqAbnVxXFgj
 qpixNJCxcpn2XJg/aYlfbn/wh7upXA7JcPjV0W04HbzpPGznUKQswcXgDsoiob3n8eiD6ALX5yG
 lwOISecV1/EZa9lo+41xrRhDhDw+h4ng1N6+DrvFkDlJefW40/femrunJGD18Fx3ShZz/fb9E3E
 uxTfuadGqJR8CnGvFLqUqK1SgG1Ja6osJzqs4hsP8iWnrwJOaB1L+27OLXRPEqKcQiapS3jN6m+
 pdMtByB/wGuvovyYw05UV8mxEZwlPSs7dWAZ1BUAnVPmeieu9dNUnakvZsIb+9B45N6GQrFLfjs
 Yu2te7acOZ5vIycj2HHOhjkFk5T6lkLfN710rdw7jHI8gmyi9dLeyrVHJE6N6ep+mul+F2pud43
 4C5r5g+kJpwiVC3uPGw==
X-Authority-Analysis: v=2.4 cv=StadKfO0 c=1 sm=1 tr=0 ts=69cbe727 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=855S8uPTkML1Oy45N9_h:22
 a=Ikd4Dj_1AAAA:8 a=scxTcjKw9OI2Du0FDOwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-Proofpoint-ORIG-GUID: NXVIy-VuZyayD4tXQbvqtwbw_fdIe9EQ
X-Proofpoint-GUID: NXVIy-VuZyayD4tXQbvqtwbw_fdIe9EQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57801-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[meta.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,nvidia.com:email,meta.com:dkim]
X-Rspamd-Queue-Id: 1C33736BB31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HI Jason,

On Mon, Mar 30, 2026 at 2:33=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Mar 12, 2026 at 11:46:07AM -0700, Matt Evans wrote:
> > A new field is reserved in vfio_device_feature_dma_buf.flags to
> > request CPU-facing memory type attributes for mmap()s of the buffer.
> > Add a flag VFIO_DEVICE_FEATURE_DMA_BUF_ATTR_WC, which results in WC
> > PTEs for the DMABUF's BAR region.
>
> This seems very straightforward, I like it
>
> Did I get it right that the idea is the user would request a dmabuf
> with these flags and then mmap the dmabuf?

Right, export it with a requested attribute (as possibly some
sub-slice(s) of a larger BAR if you like) and then map it (no
attributes need to be specified at mmap() time).

Thanks,

Matt

