Return-Path: <linux-media+bounces-27519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A726A4ED12
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 20:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B8D716C252
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 19:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B326325DCEC;
	Tue,  4 Mar 2025 19:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRYNBYEB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A894259CA8;
	Tue,  4 Mar 2025 19:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741115839; cv=none; b=hhVUWVzLIiVIBjpIz4IKJ22sqnEHsLLf4C2u/2aGk/oF3yx2BJVlC2UnyL+FcHdmj3NGMmjMJPpVGmSSvSCKXjP+JnUHk1FgCQ/YbZnrJWWeL8bhb8rzDD53D4Z14qxU/4ChbB4CVdiEb3jBRy0ShLGCXaukKpxa5A6gfclGr8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741115839; c=relaxed/simple;
	bh=71zrPBadSpry4UNGM7EYnqgo5CnGblRzB2FptXkHvoc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lwyNofdIo16bt+tVn+9QYykl5C7jHLpO3xfg9QbVRSTX5nhd12zl+lgOVlZJLrnFMKk2prT53Y/vXpGzua3k04E8JiQamVrmZzZrI/ztbvm4qygGbxqL0HfPrQB4v+GsHlbE2eebprL9z7elWuBxOA8BWGd4NxgJ2UOr73DBiRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRYNBYEB; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8a2fd46ddso7646546d6.1;
        Tue, 04 Mar 2025 11:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741115835; x=1741720635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6zRcHrLZY9EoRfX7Tn+hs2QGXmbsG5cYizLUiF4DS5k=;
        b=gRYNBYEBlYVfX2Y1N3XJmVC1IhyXem6knoI9C4irKAS5v0dmdj93r24VbuLtZaA9B0
         wv9RpCJoMrXlx/UAiAMyiZEXdIxrLDy1D79o1A76KJVGARQGy/1rf415tfUWFgY6yvwy
         uPtRo69rHhCtz3KxgJThE0/KZCtUo/13ShafvqVV7ViubdLfIhebEgPAO4MX62ouqgCl
         KkBY4mRazk5e6tyB+xOOoxe/GMHyvcADt9Q59srtUH6CVNTjUrRUnnKxY7ulH3sPcR/q
         zEJj/89DpOw9K8rYQxIB/GI9/EgXlY5q5nXQWykOqhhAKvFUmEvGSwvaNTg1mdgH3dkL
         NYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741115835; x=1741720635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6zRcHrLZY9EoRfX7Tn+hs2QGXmbsG5cYizLUiF4DS5k=;
        b=NQlS0c/w+aQdoXaTT4ZAArjgbUNz74IlPrv/5NTHra83TyP6PXm5HoEW+yjqRrYG3y
         ebce/JD4P6UDz1Ung9cylZXE1Dt+/n2gJBuWepQcoTe5KDZro7NGmnP1wfM/pI3jvyQy
         vljB5qKHpgKckWeXAl28nvI6hJACER7qzXIFsDVYMvN6ULv5W7Ilxs+0PngLRQ/FI/qO
         +gWJ0VBX8ZaQnZwv5M4/zJrL7fhrVHy3kJVmrMZQHC3Qfx8zl/VgLjxApaU63lQeLPqF
         DTbshmOLX1fFXyJSlfzmUPKoC1DG4h2hroUylbKPgds1vW1gL7BVDunTnryo/NqKO3oL
         8c1A==
X-Forwarded-Encrypted: i=1; AJvYcCVvXV80VBglZK4fj7XD+t9b+hEYMKHM5dj1PL1ZAZNDyVJCR07+NNV1re3qrB9XkkUDblwI7JO7RomX2Gc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/H9EVudDI5bmfXGOLaePGQUizgKYuYLg9V9yXK1Y0xedph59p
	5qqG9iqRWHXHG2Ylpd9pLe3ITFjmhPXCq3zLN394hDcy1YDR+sPE/a9kDg==
X-Gm-Gg: ASbGncvGYk1K3f0cH8UEB8k9FE7uSkiE8dd3gFnf33wiuQwDYAnDsgHluwDogLQoSa5
	8NXTFpzvRSZwYHhD07TKnkgGQ7In1V+nU+rh3ykCwDOdurP/vEyzXUuMQht7fXMG6IVtLxqXFkR
	Wzs59nA6NFYkAeXx+sxJvG6ciaq62xSuoPUx0u/5ZXyD8PCVxiZjUxRj3PriotOcS1Z1ULA9v4I
	pneGOVdtOSDWuU45Og4WUcdGH3w16OsLACgq8Ob4En6WS0rJixXhXccs3xiWyfOq38RBBI3Fswi
	E9f5HKYx4uE7jjIzhDDxSDp8PR8m07SPDS7i6lBaZ4LWpd9TMQ0LZpnWnF0KrvRn9OHoNX3K3yv
	aoI/i9abjTg==
X-Google-Smtp-Source: AGHT+IGFEVxkxJdDHL70k8ZQHEkVjG2El2E5FYW5OuYB6c//CkBOdewtyopoiMtF/Fbxc/jwWaZDUA==
X-Received: by 2002:ac8:5715:0:b0:474:ee9d:43db with SMTP id d75a77b69052e-4750b4b7362mr982781cf.11.1741115835373;
        Tue, 04 Mar 2025 11:17:15 -0800 (PST)
Received: from matt-Z87X-UD4H.mynetworksettings.com ([2600:1002:a012:8f2c:1c50:24c:178b:a9b3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474f351687bsm24079351cf.19.2025.03.04.11.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 11:17:14 -0800 (PST)
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Majewski <mattwmajewski@gmail.com>
Subject: [PATCH 0/3] media: vim2m: add multiplanar API support
Date: Tue,  4 Mar 2025 14:16:58 -0500
Message-Id: <20250304191701.2957096-1-mattwmajewski@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This patch series adds multiplane API support for the virtual M2M
driver, along with some minor driver refactoring/improvements.

I followed the lead of the vivid driver and made multiplanar support
selectable with a module parameter, and the default is to use the
single planar api.

Although there are not yet any pixelformats in the driver that make
use of multiple memory planes, adding support for these should be
easier now with the API level changes taken care of.

v4l2-compliance reports the following with multiplane support disabled:

  Total for vim2m device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

and the same with multiplane support enabled:

  Total for vim2m device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

Patches need to be applied in increasing numerical order (Patch [3/3]
depends on [1/3] and [2/3]).

Since the multi-plane changes had to touch a lot of the driver, I did
a basic regression test with the following script which generates a
test input image with vivid and an output image from vim2m for each
supported format. I confirmed all outputs visually and verified they
were identical to the outputs before the change. Testing was done on
an x86_64 qemu image.

#!/bin/sh

# tested with HDMI vivid emulation
# modprobe vivid num_inputs=1 input_types=3

vim2m=/dev/video0
vivid=/dev/video1

width=640
height=480
out_width=320
out_height=240

capture_formats=$(v4l2-ctl -d $vim2m --list-formats | awk '/\]:/ {print $2}' | sed "s/'//g")
output_formats=$(v4l2-ctl -d $vim2m --list-formats-out | awk '/\]:/ {print $2}' | sed "s/'//g")

# Turn off text mode so that images will be identical
v4l2-ctl -d $vivid -c osd_text_mode=2

for ofmt in ${output_formats}; do
    # generate input image
    inname="${width}x${height}.${ofmt}"
    v4l2-ctl -d $vivid -v pixelformat=$ofmt,width=$width,height=$height,field=none \
             --stream-mmap --stream-count=1 --stream-to=$inname
    for cfmt in ${capture_formats}; do
        outname="${out_width}x${out_height}-out.${cfmt}"
        v4l2-ctl -d $vim2m -x pixelformat=$ofmt,width=$width,height=$height \
                 -v pixelformat=$cfmt,width=$out_width,height=$out_height \
                 --stream-from=$inname --stream-to=$outname --stream-mmap --stream-out-mmap \
                 --stream-count=1
    done
done

Matthew Majewski (3):
  media: v4l2-common: Add RGBR format info
  media: vim2m: Simplify try_fmt
  media: vim2m: Add parametized support for multiplanar API

 drivers/media/test-drivers/vim2m.c    | 327 +++++++++++++++++++++-----
 drivers/media/v4l2-core/v4l2-common.c |   1 +
 2 files changed, 274 insertions(+), 54 deletions(-)

-- 
2.25.1

