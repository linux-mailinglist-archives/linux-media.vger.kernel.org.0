Return-Path: <linux-media+bounces-46235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97348C2E827
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 01:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD751189AB86
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 00:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8A93BB40;
	Tue,  4 Nov 2025 00:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="NWnzXUX1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B62DDD2
	for <linux-media@vger.kernel.org>; Tue,  4 Nov 2025 00:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762214783; cv=none; b=PTDA34M+YDCM9MnfSBtKzyQ0K6DpLFuO3Z4ylJjInsvNfXauUMAVX3u0yNmhs52DT0CeKuGVRJTJqg4PVw8v9YY7k/gn0a0hkFmzJX3o+T+SzSO2YrOqIBxSEAvbCPB2p8pUCgV0wG6IrtMyWj9P2Zg0/YAfyzfwY2140k3ehvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762214783; c=relaxed/simple;
	bh=64FaqhTpKtgrI6Gs/Bdk6B1sd1M3Ri6MbXFvGYn46WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VstyZQPSYdFxpSJ0nznRR44DCDHBOuYnrABHwCXHxe/nBU3YVE9nHXszy7w6UWRsjC3YwLtfr1zeNLzmcdlPVoDH3Ubstqa8sUvE0Hv45kUGKBCCmVR2r7l6xRP0nTSU8GHv5Ao2flQh6OpaSbHreBvYywLJcMfr6sp9pvIRYXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=NWnzXUX1; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-87a092251eeso79541726d6.0
        for <linux-media@vger.kernel.org>; Mon, 03 Nov 2025 16:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1762214781; x=1762819581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q7OiTJylN5oi1hTg8WqhFTipXs7uLO/TT2JZJ2yqlyQ=;
        b=NWnzXUX1hk49UJaLbG2SqXegov/uwDQbmjbqzv/W/LpczLFDjCaWNgtOn6gLOZ57gw
         ie/+3MSlss7KIhGF5RlvdPHmS5IlfJSbJTduPNddlZUBHT3Zh3aOBwo7CobAcJivKmze
         30efnR14s4FPpMuRSqpkBQ3GxsR/+xcmmdJD+C2iQxP0yhbEeY6JITguDRiG1WxiwjCt
         bRjNRs5IyR+hrkzrqFcV1vhefYWQ9y/Ni/B4ifAbN3kpzK+vbYbuvwGd7YZjzdAyXd1v
         ObFPv1B5+kAU5MQczokwWEiwODyjI/H913VXZSV3NWcb2bQYKnemWJGEJ4a3EPrOEBap
         5lPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762214781; x=1762819581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7OiTJylN5oi1hTg8WqhFTipXs7uLO/TT2JZJ2yqlyQ=;
        b=U8pXrllOo4A3SL0gtY6g6CmNC9AsJcbh7MPrIrvnAEgonGj6Y+6Xv2VuSwZ6czxqzM
         1zrZ0lnfUAfNNaLB30eMLnWG3oMljW0aK8Hn8Xga5Q1vjluwekFRoduoZcJeYawYbwPa
         XMmZK3rz8FcaVfcqnz36Qp/7LoIwyZH3e1lC1qZIW6utPrY2EnLnuGNIMbNZW8RXGpBY
         UMR7aKu0rNOT0wAazA192ooH4c8NJ47Sezri3Bw7ecwFYbVDWJFpYApbINp1WPVSS9Yr
         EtixwNddWH+XgXZmmiEFAG2orI1dnqKyW8WwRUNzdNaXbJtNsp/SKX+z0hL+9Q/4o+1L
         ZLdg==
X-Forwarded-Encrypted: i=1; AJvYcCVtvComRwpGDdqrDLV238cTbipm7JaNBi+XHWwmJaORgOzCH30ejsaMQwYTfIYRwxKvRWR6itnzALIcmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU6YGfcIw+lOdQX/8I/Vwu+IqfVUXrU11OXRik7QATyvNz335g
	yHgikpxCH+hZXHx4nw1mAmpnObhjo0d9cDg7Xlf+WpjoeAPHLrcm4vt6vnqWDf7cM2Q=
X-Gm-Gg: ASbGncu8D6+tERiOIPPweYiRIe97mqwE62OfO41F05A+TMbWptMdKf0UknmKx1recu+
	0jBr4w02CzM8+eCR2xKaygGhkFcJsX9KYMdtd49s8EDsUXtUZcUvA/1B4GOsHxUn1BRrOmIrcGr
	PjNS4suinGc6Q/fslC7m16b7H5en0RANfn6LpuXuo//SHx5xwPG9ac2OHzObzM6p7gHDzL8yRm3
	hZ2/qFpZyCm2Dlu8UnvQXU1qFVh2tX27HogJDvX9/ci4Fpd7UoCA9TCszO0mc48pNi5vNcv7g5X
	ki02JlXSJ2JFxQs0wFUlbuslO0VzxWHhc7FiLG4fw8H54guT6MzL8DoKeowqM3ZEnx1s9g6aQLW
	VhqDHAiSiSgym9N1IAlfOa/jw/PJb0YTB7GDCQ7k5VWIHrTaN9VLnxZa9TQ3rNuai7EtkZIaG5h
	RZ6wDoV5sBMJPGl0rzQHCBL/YPLQzMvu80yD6BYf1rejyP2Qw7nGYDlcBL
X-Google-Smtp-Source: AGHT+IHFK/K4+Si4Ey1hcSvTZvkQdBHi3cl9Mtxmbm7oCurYD+QrPfezppoNLd/K4DVB+Xp/dYAQ0Q==
X-Received: by 2002:a05:6214:f22:b0:87c:270b:aadb with SMTP id 6a1803df08f44-880623a4a0emr16632746d6.16.1762214780972;
        Mon, 03 Nov 2025 16:06:20 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88060de9b44sm10817116d6.20.2025.11.03.16.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 16:06:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vG4Z1-00000006cRs-0csK;
	Mon, 03 Nov 2025 20:06:19 -0400
Date: Mon, 3 Nov 2025 20:06:19 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Mastro <amastro@fb.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v6 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20251104000619.GG1204670@ziepe.ca>
References: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
 <aQkLcAxEn4qmF3c4@devgpu015.cco6.facebook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQkLcAxEn4qmF3c4@devgpu015.cco6.facebook.com>

On Mon, Nov 03, 2025 at 12:07:12PM -0800, Alex Mastro wrote:
> On Sun, Nov 02, 2025 at 10:00:48AM +0200, Leon Romanovsky wrote:
> > Changelog:
> > v6:
> >  * Fixed wrong error check from pcim_p2pdma_init().
> >  * Documented pcim_p2pdma_provider() function.
> >  * Improved commit messages.
> >  * Added VFIO DMA-BUF selftest.
> >  * Added __counted_by(nr_ranges) annotation to struct vfio_device_feature_dma_buf.
> >  * Fixed error unwind when dma_buf_fd() fails.
> >  * Document latest changes to p2pmem.
> >  * Removed EXPORT_SYMBOL_GPL from pci_p2pdma_map_type.
> >  * Moved DMA mapping logic to DMA-BUF.
> >  * Removed types patch to avoid dependencies between subsystems.
> >  * Moved vfio_pci_dma_buf_move() in err_undo block.
> >  * Added nvgrace patch.
> 
> Thanks Leon. Attaching a toy program which sanity tests the dma-buf export UAPI
> by feeding the allocated dma-buf into an dma-buf importer (libibverbs + CX-7).

Oh! Here is my toy program to do the same with iommufd as the importer:

#define _GNU_SOURCE
#define __user
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include "include/uapi/linux/vfio.h"
#include "include/uapi/linux/iommufd.h"
#include <string.h>
#include <sys/mman.h>
#include <errno.h>

int main(int argc, const char *argv[])
{
	int vfio_dev_fd, iommufd_fd, ret;

	// Open the per-device VFIO file (e.g., /dev/vfio/devices/vfio3)
	vfio_dev_fd = open("/dev/vfio/devices/vfio0", O_RDWR);
	if (vfio_dev_fd < 0) {
		perror("Failed to open VFIO per-device file");
		return 1;
	}

	// Open /dev/iommu for iommufd
	iommufd_fd = open("/dev/iommu", O_RDWR);
	if (iommufd_fd < 0) {
		perror("Failed to open /dev/iommu");
		close(vfio_dev_fd);
		return 1;
	}

	// Bind device FD to iommufd
	struct vfio_device_bind_iommufd bind = {
		.argsz = sizeof(bind),
		.flags = 0,
		.iommufd = iommufd_fd,
	};
	ret = ioctl(vfio_dev_fd, VFIO_DEVICE_BIND_IOMMUFD, &bind);
	if (ret < 0) {
		perror("VFIO_DEVICE_BIND_IOMMUFD failed");
		close(vfio_dev_fd);
		close(iommufd_fd);
		return 1;
	}

	// Allocate an IOAS (I/O address space)
	struct iommu_ioas_alloc alloc_data = {
		.size = sizeof(alloc_data),
		.flags = 0,
	};
	ret = ioctl(iommufd_fd, IOMMU_IOAS_ALLOC, &alloc_data);
	if (ret < 0) {
		perror("IOMMU_IOAS_ALLOC failed");
		close(vfio_dev_fd);
		close(iommufd_fd);
		return 1;
	}

	// Attach the device to the IOAS
	struct vfio_device_attach_iommufd_pt attach_data = {
		.argsz = sizeof(attach_data),
		.flags = 0,
		.pt_id = alloc_data.out_ioas_id,
	};
	ret = ioctl(vfio_dev_fd, VFIO_DEVICE_ATTACH_IOMMUFD_PT, &attach_data);
	if (ret < 0) {
		perror("VFIO_DEVICE_ATTACH_IOMMUFD_PT failed");
		close(vfio_dev_fd);
		close(iommufd_fd);
		return 1;
	}

#if 0
	int mapfd = memfd_create("test", MFD_CLOEXEC);
	if (mapfd == -1) {
		perror("memfd_create failed");
		return 1;
	}
	ftruncate(mapfd, 4096);
#else
	struct dmabuf_arg {
		struct vfio_device_feature hdr;
		struct vfio_device_feature_dma_buf dma_buf;
		struct vfio_region_dma_range range;
	} dma_buf_feature = {
		.hdr = { .argsz = sizeof(dma_buf_feature),
			 .flags = VFIO_DEVICE_FEATURE_GET |
				  VFIO_DEVICE_FEATURE_DMA_BUF },
		.dma_buf = { .region_index = VFIO_PCI_BAR0_REGION_INDEX,
			     .open_flags = O_CLOEXEC,
			     .nr_ranges = 1 },
		.range = { .length = 4096 },
	};
	ret = ioctl(vfio_dev_fd, VFIO_DEVICE_FEATURE, &dma_buf_feature);
	if (ret < 0) {
		perror("VFIO_DEVICE_FEATURE_GET failed");
		return 1;
	}
	int mapfd = ret;
#endif

	struct iommu_ioas_map_file map_file = {
		.size = sizeof(map_file),
		.flags = IOMMU_IOAS_MAP_WRITEABLE | IOMMU_IOAS_MAP_READABLE,
		.ioas_id = alloc_data.out_ioas_id,
		.fd = mapfd,
		.start = 0,
		.length = 4096,
	};
	ret = ioctl(iommufd_fd, IOMMU_IOAS_MAP_FILE, &map_file);
	if (ret < 0) {
		perror("IOMMU_IOAS_MAP_FILE failed");
		return 1;
	}

	printf("Successfully attached device to IOAS ID: %u\n",
	       alloc_data.out_ioas_id);

	close(vfio_dev_fd);
	close(iommufd_fd);

	return 0;
}

