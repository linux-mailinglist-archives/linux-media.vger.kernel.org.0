Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 716EB39CE1E
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 10:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhFFI0X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Jun 2021 04:26:23 -0400
Received: from mail-ej1-f50.google.com ([209.85.218.50]:39523 "EHLO
        mail-ej1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbhFFI0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Jun 2021 04:26:22 -0400
Received: by mail-ej1-f50.google.com with SMTP id l1so21403453ejb.6;
        Sun, 06 Jun 2021 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N/vOnbubwerL0nc4R2J7xmAJRI2agwwqe8FU/KvYiSg=;
        b=RkOuCWPUM3rS/puvGGtl+u6x/466zVzs6idAXCdCzv/oxKqF3p4g4BPEqIRFs4kv7+
         n+huszyyrKlaX8ULmfxtaYiV4+viKf+yPqV/GVS6jrJieDVHmHzDqfQuRcnIOvJ3wzku
         ZTbPdxB4LecEptg17ERwrQksLz/2W8EqqZmzXMt4pvq4Id3js1i9H7fe4A9YaD9/WSSB
         FcSH1RwJJvOaiSQoZT4+GfTKRMFR3d9dPo/xbsJTTQKfrt37YTvpwflseGJbCjmbk4B8
         UF6pslpmrctlSgTo15cWjq3sfi9Tf172+Ngv84Qx5ogwQAtxhB2AcLucKm775Yc8KfHS
         KLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N/vOnbubwerL0nc4R2J7xmAJRI2agwwqe8FU/KvYiSg=;
        b=GlhN0qHfNVqcab8+63x1lRcX/0I0WMcD+gk6LYai/bpu9YbHOqj5SnPeGnZ3vDO75M
         eZ/Y5ns/+Fj1xC3/PMjKqYL/Wt1e+++xcgJUTXS0DGJb2hpF5nscLXjz30Q3FaVpjMC0
         CgrcFlkgXa+gLXGe3WowPhRI8tqoC07cPyyCN6T8Mp6IrGLxBhIOXbiqEBUXP5jxKGk4
         z9fsklOEVaUUyoxHoAecYBrExrgczEV25RgA5yFGN1X1jhjU06QnNQgRyRqR34aGNmPb
         9Tq7mzW9JoEgrbKD+NYZnAQ3vIvWNgr8ecXQVnLjlmxKO4C5v1Q/a3QP5DKhx/wMt/Os
         KzPg==
X-Gm-Message-State: AOAM531fwZgbqQqbBHmk1OqqCLTBz8zGNjBWBom5RhPwlx9fbU9xWtbq
        Z0jsPrODaRnkNxn6DvF+2mRgiaaHYSw07w==
X-Google-Smtp-Source: ABdhPJyAALTJE+uOjrSqsQrGA4Ld/5qb+yfFGBo+PZkaanH7pQiMtJjPAWsx+PCTFw+aTBgaJKjFug==
X-Received: by 2002:a17:906:d1ce:: with SMTP id bs14mr13030518ejb.183.1622967812482;
        Sun, 06 Jun 2021 01:23:32 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-17-133.cable.triera.net. [86.58.17.133])
        by smtp.gmail.com with ESMTPSA id y1sm4945908ejl.7.2021.06.06.01.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 01:23:32 -0700 (PDT)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com,
        benjamin.gaignard@collabora.com, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] media: cedrus: hevc: add support for multiple slices
Date:   Sun,  6 Jun 2021 10:23:12 +0200
Message-Id: <20210606082314.454193-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HEVC frames can be encoded in multiple slices. This short series add
supports for them. First patch adds slice_segment_address to HEVC slice
parameters and second patch implements HEVC multi slice support in
Cedrus.

Question 1: HEVC specs talk about slice_segment_address, but "slice_"
prefix seems redundant in our case, because this field is part of slice
params structure. Should I drop it or leave it?

Question 2: I made slice_segment_address __u32 but __u16 might be
already enough. Which one should it be?

Note: These patches depends on following pull request:
https://www.spinics.net/lists/linux-media/msg193744.html

Jernej Skrabec (2):
  media: hevc: Add segment address field
  media: cedrus: hevc: Add support for multiple slices

 .../media/v4l/ext-ctrls-codec.rst             |  3 +++
 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 26 ++++++++++++-------
 .../staging/media/sunxi/cedrus/cedrus_video.c |  1 +
 include/media/hevc-ctrls.h                    |  3 ++-
 4 files changed, 22 insertions(+), 11 deletions(-)

-- 
2.31.1

