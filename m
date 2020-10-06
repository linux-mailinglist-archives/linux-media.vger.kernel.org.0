Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDAD284722
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 09:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgJFHaN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 03:30:13 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:37023 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726822AbgJFHaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Oct 2020 03:30:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PhQEkHAOjv4gEPhQHkvAhz; Tue, 06 Oct 2020 09:30:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601969410; bh=WWcyIvpgnFNcJSNYbnyawXMY6B4Iu//eoG5B6dD/QBM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=arJzxBRfp07iJV/BOjlDudNbLnBTljRHJz3plxsAfS1uZlb57K50f3cK6jdyQez2R
         8dvWBhJWliSDflV8/Bka9IhI+udTiw8mfRaZ5f5plQ+OyeyKJcA7+NeEWE1Yj2StjV
         tIHpd/1G96bXs94irtwK1k2oo5RmHZMcNKWivbXbfvqdrhv6LYsGNaAhW40EifAmUV
         3p3lo0qneK7Inkru20rW/Y8D38xIBnJT/U5e+Qt2nBeGJNayApYp4O3NLrjzjpG3oz
         aIzPUFE5+UtRqnwz4ztgz89LWWq/1o9NQwqFW3bfl83XYNKDWsDhliK6ny10E6OHiL
         P8Lp/84oDTUtw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/3] Three fixes to clean up daily build warnings
Date:   Tue,  6 Oct 2020 09:30:03 +0200
Message-Id: <20201006073006.2315225-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJ4GUOsLW1ZWlftxlFx5SVBWtEGjnen6WLhR+/T5rA7Gsgn1FgsGRqBtt7exQED2Y5jUcCUEe1DzO+CWRD9eQoYqB0QOivRnv0lsM5cYCoc/zWNKkmMW
 ESlClNCNU3pj5kM1NLEHIsIitAVuAUuE8MQjAEC5QTxEqpEZjVVYuQsi/wsuR+FgoKoHZb7IZwX3Vg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

New warnings appeared in the daily build after switching to gcc 10.2.0.
These patches fix those warnings.

	Hans

Hans Verkuil (3):
  tvp7002: fix uninitialized variable warning
  dvb-frontends/drxk_hard.c: fix uninitialized variable warning
  s5k5baf: drop 'data' field in struct s5k5baf_fw

 drivers/media/dvb-frontends/drxk_hard.c | 2 +-
 drivers/media/i2c/s5k5baf.c             | 5 ++---
 drivers/media/i2c/tvp7002.c             | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

-- 
2.28.0

