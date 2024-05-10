Return-Path: <linux-media+bounces-11322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF308C25F8
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 223521F26E4A
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 13:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0766212C520;
	Fri, 10 May 2024 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KD61kaEB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D526A7E58F
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715348618; cv=none; b=MbWspuOBkFqAhfumqMcLLoAezuZ32B+muVVycvvsZdFEZh1gYMyGk3e3bVAehC7njITEDChUqwRczuY35BohHqsdEP6jTa0Br4Zaw1nBZ966lX1UTWinplVCfoZKPzQku/cc6yP0kYrkgulL7snYDtzPJhxcoxpRklVRoUfcftw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715348618; c=relaxed/simple;
	bh=BoLQvBVJOoCjk+iZrCEftQdwEpUcH5Vtc6iOYEj5zqs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YcCy6w3XQuAiyc/C5pxnY/MqGGR0fiA2XTlqmxW3ySfdNJ00Z0gypDyDgT395+R6kUfdGGcUhcwtmu3AWwSs9aYsKK+M+Z4ysScwL05OHkW4q/G5Ev24d2Jfl/blkGZSCr/NT9YwQ0U6mC/LFprfh7lLwezXAkwKOXUhqgE63mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KD61kaEB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715348615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EGPFRAm20EF2gNKmn5OIm+wKsmkKPz5p/hST/VOsK7U=;
	b=KD61kaEBMUKk0D0NY3QIztfrlLY6w4nEBiA/oOaEqWlqev6tmJW3TCnZV0jpGAVKXr4uXq
	0oy8FCSHmlKvbuhdZgT6FYtFDIQckNbM+FTKYyAy9AmEjxuYzNdPaB7XyladD0mE8vU6+s
	l7Iz4G1fdMmffTyw4p5NiQeyQrYiLuI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-RkAVSjXyMYCP04LLMGCxHw-1; Fri, 10 May 2024 09:43:22 -0400
X-MC-Unique: RkAVSjXyMYCP04LLMGCxHw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E746E800656;
	Fri, 10 May 2024 13:43:21 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.224.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDB475751BE;
	Fri, 10 May 2024 13:43:18 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-dev@lists.oasis-open.org
Cc: cohuck@redhat.com,
	alex.bennee@linaro.org,
	changyeon@google.com,
	daniel.almeida@collabora.com,
	mst@redhat.com,
	virtio-comment@lists.oasis-open.org,
	linux-media@vger.kernel.org,
	eballetb@redhat.com,
	gurchetansingh@google.com,
	nicolas.dufresne@collabora.com,
	acourbot@chromium.org,
	Alexander.Gordeev@opensynergy.com,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH 0/1] virtio-media: Add device specification
Date: Fri, 10 May 2024 15:43:16 +0200
Message-ID: <20240510134317.3201746-1-aesteve@redhat.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

Hi,

This a formal attempt of including virtio-media
device specification.

Virtio-media came from a discussion on virtio-dev
mailing list, which lead to presenting virtio-v4l2[1]
specification as an alternative to virtio-video.

Later, virtio-v4l2 was renamed to virtio-media[2]
and published through:

https://github.com/chromeos/virtio-media

The repository above includes a guest V4L2 driver able
to pass v4l2-compliance when proxying the vivid/vicodec
virtual devices or an actual UVC camera using the
crosvm V4L2 proxy device. Steps to reproduce are
also detailed[3].

There is some overlap with virtio-video in regards
to which devices it can handle. However,
as virtio-media will likely be the virtualization
solution for ChromeOS (already landed into the chromeos
organization) and possibly other Google projects for
media devices, it would be desirable to include the
specification in the next virtio release despite
the aforementioned overlap.

The device ID in this document differs from
the ID in the virtio-media project repository.
And it will probably need some discussion on which
would be the correct definitive ID.

Full PDF: https://drive.google.com/file/d/1PG1YxzbSvQHPphFhbUKyKKdvuwO6shyi/view?usp=sharing
PDF with the media section only: https://drive.google.com/file/d/1Y7kAGzlUfl30VIUx9wQtz5sFTkWnBiyA/view?usp=sharing

[1] https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0
[2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html
[3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md

Albert Esteve (1):
  virtio-media: Add virtio media device specification

 conformance.tex                           |  13 +-
 content.tex                               |   1 +
 device-types/media/description.tex        | 574 ++++++++++++++++++++++
 device-types/media/device-conformance.tex |  11 +
 device-types/media/driver-conformance.tex |   9 +
 5 files changed, 604 insertions(+), 4 deletions(-)
 create mode 100644 device-types/media/description.tex
 create mode 100644 device-types/media/device-conformance.tex
 create mode 100644 device-types/media/driver-conformance.tex

-- 
2.44.0


