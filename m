Return-Path: <linux-media+bounces-50922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 17925D38677
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 21:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11BC03035A83
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 20:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293333A0EA6;
	Fri, 16 Jan 2026 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eSS9xI9c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KKBDz6Vm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3432B9A7
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768593997; cv=none; b=AaUmIwNmsICsr2GLMiMHkREG8s4QhuidX8il/c2qycadcED+7A9f/EE2zzpPuzd7iMHvRVcJDzIoWT7yytV0IAzKtNasINaK2gEB0IygHPbQq0l14KRigS/dDfVCadTncx60pgG8f83Eh2OeF+SbV7lxNMaKKaFgguY5na+3L80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768593997; c=relaxed/simple;
	bh=loxmsr3uoINMYcnvLPxoTbd+oABX6NHwSUDVPhyN0WU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ERONst3YXVuUbIY6MJ6DshLyhL0kz7CMnZjVDaxt5LGiNOVEAHgYrxJELNv6IjKYh8qnvBMUfXnmNhD7IhnubjSrtHWBuQmV0qvQFhM4pIrJiIRQ5dCoOOt+YN/EaF8LmkFmBt8iDKdfHgVwKunAXXY8PmQuNbQmtnaN0JvILlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eSS9xI9c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KKBDz6Vm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768593995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RvRBiNn3PA4K2OZWbkrvyWY2CSIU7KWGY6L6xdZjPVQ=;
	b=eSS9xI9cvTfGtbsMoCAMaUkNxVTNtzY09ZqTXSRG7s2pRWgaARMVRgUiG1YQFwaBqQCuSf
	dkSno2kG+eut38xDHuje641vY6Kcndk2Cu0PQOmiqEabgorFguRRpAkgmYtZhakbDKOE/H
	Iw4lpsmX7aZhveCIAYOvvmEiqfLHAp0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-5faE-j0RP1i5WOrADoz-kg-1; Fri, 16 Jan 2026 15:06:34 -0500
X-MC-Unique: 5faE-j0RP1i5WOrADoz-kg-1
X-Mimecast-MFC-AGG-ID: 5faE-j0RP1i5WOrADoz-kg_1768593993
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50145d24ffcso67773391cf.0
        for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768593993; x=1769198793; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RvRBiNn3PA4K2OZWbkrvyWY2CSIU7KWGY6L6xdZjPVQ=;
        b=KKBDz6VmxFC8+DUWRWVqNo19rVEymBkzqfBrynms8PRJ2XGpSWMe+Stc/WOzRkiu4K
         SvJaSaAmsiEijGXVPQaEJpcNfDHvo4Jv2C3Nnk35lorIEFkv44e37xSm9QQL4wlOwtEC
         GewOh1Pgxx2LWwqOXp3SUJ6UQ/Us4diKKhh7kkdGwAQxynBjI7XV/BAs6nHA4DXw65sl
         k6qg+c/G+1KcUtS6i5xI9OnULWoEXdkuCj5IGTB/fgOJrrEQxj0l513in3GvqDh+CsTe
         8p8Fj9jj3RCRE3luGBx8p+P7BkAlfN68Ozs939P6hYcMiBUk4RWY/Que7x7I+3+fCKrU
         xEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768593993; x=1769198793;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvRBiNn3PA4K2OZWbkrvyWY2CSIU7KWGY6L6xdZjPVQ=;
        b=NrlL6McLFmu2tydE5m5A7rFhYJgnY4rvTLOaBjgWKoe6By7J/Aph1VNVdsh17uANPU
         1qQFUfP8PvjGaXmofDcL8myp4HwnGAtYXLT0nnxthIlyZwY6NJE1LooiUXy1LZ92kv1P
         bYyZOrZEuXc8uLbPIB9wpIx1aeBq/4GZ/XQuCqtAYwvXElcvRYga5mWpd/W5uIHLGDV8
         34febzDtmG4QtTjIOz28MThZSWS1iCfbZ+KJMS/YTw62PDCQtnm1zHSZy0X+Xo6OwKto
         RMSfb9DwJPVzzujyN4vleLZiCL72XafaC216sIcTTF2+41OBaqQgzRdRAmZwti8SBvaE
         +4Qw==
X-Gm-Message-State: AOJu0YxGAw1zQ0VGrM4xMOYLtAQUSWayALV/+3STFCIGlNS7gIyt6U2H
	iqZtSmdSXijJ5Ex7qL76MagmhuCBGBwa5aXoHFSAqRk2DX8UDqNBdt6kNTJPc5mn7hoZFw52axJ
	VXSiXTiHmaJZ2cGNUavqcQfksMrnNU3LH6esPCNvSxorWfx3vd2vqbKD6vuBE773C
X-Gm-Gg: AY/fxX5pXw6Co8p2JwRKIRZ3SzdJ3cy7UpKkC0AR96uySzKuuPTWg8gy0lvHZbeggI/
	BS2ybEn84Rnol5dJDlUV4zNV/qCi5SkdPn6rUXsq4kamjPfs5nv8K1y9d+3iVgzikCCspm2d/vT
	QATc01z9E5RvA3CsWRIG7fmYifDWOaOoFmDrYr/1cM5pNIPsAfglVFKshxt4EPSrtzV8v2bhiwU
	IVxQsvTHW6HhDWhvHUOjgJet7prNGYepsPtpSiOmhopnd0p+DTQJfFQjwzi+U9Sy5BrIEnkVgqL
	V+j9j5531F/skQ6qdhvq5NL/5fqRWEf2r+1n9UhZt3s2O//7TZOL/cKrFD5TUM0ToEGHb7M+8be
	EtGm33+CB32iLShjNlbnTX416lypiv5gL9Zs/V6qvSTstsEQJ+KU=
X-Received: by 2002:a05:622a:283:b0:501:3aed:fa5f with SMTP id d75a77b69052e-5019f84ac6amr105057951cf.12.1768593993410;
        Fri, 16 Jan 2026 12:06:33 -0800 (PST)
X-Received: by 2002:a05:622a:283:b0:501:3aed:fa5f with SMTP id d75a77b69052e-5019f84ac6amr105057461cf.12.1768593992901;
        Fri, 16 Jan 2026 12:06:32 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net. [100.17.20.16])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d6dfaesm32711711cf.2.2026.01.16.12.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 12:06:32 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v3 0/2] dma-buf: system_heap: account for system heap
 allocation in memcg
Date: Fri, 16 Jan 2026 15:05:37 -0500
Message-Id: <20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOsQ6CMBRFf4V09pH21RZ08j+MQ20ftEOBtEA0h
 n8XiCYujme4554Xy5QCZXYuXizRHHLouxXkoWDWm64lCG5lhhw1FxzBRXOfGvBkBsjPPFKESNG
 2YGttZC2c1tKwdT4kasJjV19vKzepjzD6ROYrVAKFECcpuC4rpY61AgTabidHl0TOm7G0fdxsP
 uSxT8+9c8bN+UkS8n/SjMCBalUhWosNHn+lt2VZ3idtdsb/AAAA
X-Change-ID: 20260102-dmabuf-heap-system-memcg-c86a381d663a
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2

Capture dmabuf system heap allocations in memcg following prior
conversations[1][2]. Disable this behavior by default unless configured
by "dma_heap.mem_accounting" module parameter.

[1] https://lore.kernel.org/dri-devel/Z-5GZ3kJDbhgVBPG@phenom.ffwll.local/
[2] https://lore.kernel.org/all/CABdmKX2_UOENujpW0dXe0Z0x+4V3onfGDmHf1DMOXfDha6ddOA@mail.gmail.com/

Changes in v3:
- Declare mem_accounting in include/linux/dma-heap.h, since it's
  intended for heap implementations. Make it __read_mostly while at it.
- Link to v2: https://lore.kernel.org/r/20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com

Changes in v2:
- Add a module parameter to enable dma-buf cgroup accounting, disabled
  by default.
- Split system_heap logic in its own commit.
- Link to v1: https://lore.kernel.org/lkml/20251211193106.755485-2-echanude@redhat.com/

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
Eric Chanudet (2):
      dma-buf: heaps: add parameter to account allocations using cgroup
      dma-buf: system_heap: account for system heap allocation in memcg

 drivers/dma-buf/dma-heap.c          | 5 +++++
 drivers/dma-buf/heaps/system_heap.c | 7 +++++--
 include/linux/dma-heap.h            | 2 ++
 3 files changed, 12 insertions(+), 2 deletions(-)
---
base-commit: 983d014aafb14ee5e4915465bf8948e8f3a723b5
change-id: 20260102-dmabuf-heap-system-memcg-c86a381d663a

Best regards,
-- 
Eric Chanudet <echanude@redhat.com>


