Return-Path: <linux-media+bounces-12703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F3E8FFDBA
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 10:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD6661C2241F
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 08:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C94015AABB;
	Fri,  7 Jun 2024 08:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aUaco5yq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2876153819
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 08:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717747265; cv=none; b=FbEZG+kOrHKWH3K26Muj5QXr3xpo38yNE7l9AeGvef4YTK1KbX3q3F5Fu7+g7G6wEFEv+duG0oS6Z7aSHowkyXP+OQbgwnqDQwcCOfRlwpHgS4I90NBdFrXNiFwGWhEzCCQ12D/aWzSIsSL49U69yQzEhsE3ldt6+Tg+8E2h9LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717747265; c=relaxed/simple;
	bh=Ev8VSr7NNjr8stJk3l9ykYSz2HHF4nYolyWUrkjRUpM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jEr01rWkU7PQrjceXj2e/di8EJbB4iSOtneIqim0X3QOLTmLhsi0dUsjZ6vA8SDqdvxowm27R+7pliZiPy+Qdwgz9Ui14XShZYVbWmgJFx/K5DuJRedtJT4ZufAUoLxg/PYspWMy7sbKlXETDXN4f93LhopMfJpSant5YjSlvoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aUaco5yq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717747262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X5wczm/4WuwuofGAgY+n6uBY4T2mqdxItzIT97XTSFI=;
	b=aUaco5yqoFkQi1oqZo7PmbTiu9iVRbWvrHRUWDF5sKUNP403mY/vPhpXoCLyWXnRsQNHn/
	EthS2g1enZOgVgKN6nO17Skl7oPS+QoLEL/QkbfNFutxQbB3ZUaO8ITYBJf6vAnAiZ7M+Q
	aGd893JkZ9dx4H6hl6cpfEw0k0z8L/k=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-480-vLbVQoU4NBmk9bAdP8loMg-1; Fri,
 07 Jun 2024 04:00:56 -0400
X-MC-Unique: vLbVQoU4NBmk9bAdP8loMg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B29C6197701E;
	Fri,  7 Jun 2024 08:00:53 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.225.67])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8E375195917B;
	Fri,  7 Jun 2024 08:00:47 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-dev@lists.linux.dev,
	virtio-dev@lists.oasis-open.org
Cc: Matti.Moell@opensynergy.com,
	cohuck@redhat.com,
	mst@redhat.com,
	acourbot@chromium.org,
	daniel.almeida@collabora.com,
	Alexander.Gordeev@opensynergy.com,
	changyeon@google.com,
	alex.bennee@linaro.org,
	gurchetansingh@google.com,
	ribalda@google.com,
	nicolas.dufresne@collabora.com,
	eballetb@redhat.com,
	linux-media@vger.kernel.org,
	virtio-comment@lists.oasis-open.org,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v2 0/1] virtio-media: Add device specification
Date: Fri,  7 Jun 2024 10:00:44 +0200
Message-ID: <20240607080045.1337046-1-aesteve@redhat.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hi,

This a formal attempt of including virtio-media
device specification.

Virtio-media came from a discussion on virtio-dev
mailing list, which lead to presenting virtio-v4l2[1]
specification as an alternative to virtio-video.

Later, virtio-v4l2 was renamed to virtio-media[2]
and published through:

https://github.com/chromeos/virtio-media

The repository above includes a virtio-media driver able
to pass v4l2-compliance when proxying the vivid/vicodec
virtual devices or an actual UVC camera using the
V4L2 vhost device (available in the repository).
Steps to reproduce are also detailed[3].

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

Full PDF: https://drive.google.com/file/d/1pNCFP06VoV8Zuyx0aDVQ7HAT4xp-pZ0a/view?usp=sharing
PDF with the media section only: https://drive.google.com/file/d/1sn3NUUeCm46zVyJKHkpytTIgGw1fUt5T/view?usp=sharing

[1] https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0
[2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html
[3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md

Albert Esteve (1):
  virtio-media: Add virtio media device specification

 conformance.tex                           |  13 +-
 content.tex                               |   1 +
 device-types/media/description.tex        | 578 ++++++++++++++++++++++
 device-types/media/device-conformance.tex |  11 +
 device-types/media/driver-conformance.tex |   9 +
 5 files changed, 608 insertions(+), 4 deletions(-)
 create mode 100644 device-types/media/description.tex
 create mode 100644 device-types/media/device-conformance.tex
 create mode 100644 device-types/media/driver-conformance.tex

-- 
2.44.0


