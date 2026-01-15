Return-Path: <linux-media+bounces-50804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 561CBD25976
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 17:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6BA930B3811
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 16:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFC22C11E9;
	Thu, 15 Jan 2026 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hWXvK4PO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF8F2C11C2;
	Thu, 15 Jan 2026 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768492936; cv=none; b=bt7yzj/kv2Ibz4fZbTz5f9Pj/sk4i5SHS6sV+0hDZgjdT0TiByFYDDlpX8mSAzeVVlAwT+H2ES+H6LnX1T7AGoALEjiKRWR2tHktvjXcqZU8GgSOasdv5N0f5LmLYgG0aiFfIEi4qUiMbVUfy34Fd69K0PCmlEjVhhemJiIoQQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768492936; c=relaxed/simple;
	bh=OL0MPCpx9xNAR1neqHVoaie9AV2LZFjYjEord3DSOmU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=dIERKG7RlRlTg1XOpKjI2KvXGc6UOVLEE+5cXkzpNAjyG9h8rQxiVnk//x8UCEl8LgeNxFnnFniMxaJ+L7SNKFRrR+4kZ1c6+DMtOjfH6IzBdpiH+rC4QEIVAApOnCdakYFH0g+BqRSOdTlt4qk8bYgrjiOrhg6cqUQvm9oNQOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hWXvK4PO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:76ee:df3c:dc54:9316:8c06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71AAC229;
	Thu, 15 Jan 2026 17:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768492903;
	bh=OL0MPCpx9xNAR1neqHVoaie9AV2LZFjYjEord3DSOmU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hWXvK4POranuOPYxZghgvGP2R3JKiqHi9P9nw8xTtS7TCVoG6koUebdVCqG3w08MY
	 vfa03CQEW0WSNEZRVhoGQMieCaIW/3Q85bK4yjurDuavAv/GGXP8AqObPvt18c5l1/
	 cv1LxcqeGEuK5BPO8LgtRzc8sHtfZUXuPD/YEQRY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fbae9c01-6a2c-46ee-963a-8e5230b860b4@ideasonboard.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com> <20251230083220.2405247-16-r-donadkar@ti.com> <fbae9c01-6a2c-46ee-963a-8e5230b860b4@ideasonboard.com>
Subject: Re: [PATCH v9 15/19] media: ti: j721e-csi2rx: Change the drain architecture for multistream
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Vignesh Raghavendra <vigneshr@ti.com>
Date: Thu, 15 Jan 2026 21:32:05 +0530
Message-ID: <176849292515.3449975.5983605057289270065@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6

Hi Tomi,

Quoting Tomi Valkeinen (2026-01-15 18:07:07)
> Hi,
>=20
> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
> > On buffer starvation the DMA is marked IDLE, and the stale data in the
> > internal FIFOs gets drained only on the next VIDIOC_QBUF call from the
> > userspace. This approach works fine for a single stream case.
> >=20
> > But in multistream scenarios, buffer starvation for one stream i.e. one
> > virtual channel, can block the shared HW FIFO of the CSI2RX IP. This can
> > stall the pipeline for all other virtual channels, even if buffers are
> > available for them.
>=20
> One stream is filtered based on VC & DT, but the above only mentions VC.
> And then later uses VC when referring to the stream. I think you can
> drop the VC parts, and just talk about streams.
>=20
> > This patch introduces a new architecture, that continuously drains data
> > from the shared HW FIFO into a small (32KiB) buffer if no buffers are m=
ade
> > available to the driver from the userspace. This ensures independence
> > between different streams, where a slower downstream element for one
> > camera does not block streaming for other cameras.
> >=20
> > Additionally, after a drain is done for a VC, the next frame will be a
> > partial frame, as a portion of its data will have already been drained
> > before a valid buffer is queued by user space to the driver.
>=20
> This makes it sounds we drain a single 32KB piece. But won't we continue
> draining that stream until the stream is stopped or the user provides a
> buffer?
>=20
> Also, does the DMA not offer us ways to drain a full frame? There's no
> way to e.g. set the DMA TX increment to 0, so that it would just write
> to a single location in memory? Or just set the target to void.
>=20

+ Vignesh

AFAIU the dmaengine API is the first limitation here, and the actual
Transfer Record (TR) structure for BCDMA might support writing to a single
address. It also might be possible to use dmaengine_prep_dma_cyclic to
setup a auto-repeating TR like it's used for audio.. maybe that can be
explored separate from this series.

But yes, ideally we need to set the target to void, which I don't think is
supported by the HW (TI folks please correct me if I'm wrong :)

Thanks,
    Jai

>  Tomi
>=20
> > Use wait for completion barrier to make sure the shared hardware FIFO
> > is cleared of the data at the end of stream after the source has stopped
> > sending data.
> >=20
> > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

[...]

