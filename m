Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20AEA1B42E6
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 13:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgDVLO1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 07:14:27 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:39621 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726551AbgDVLO1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 07:14:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RDKgjuTEclKa1RDKjj7r59; Wed, 22 Apr 2020 13:14:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587554065; bh=Zk3Gqei1CaEYrPoMqdTr49lfvfT3LP6TseMSM0jfRUg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YbYaFR25L1B+G8heeUQnPUH8N6eBkTYY5j5Kj0L2BwhG2rOMqJBtqql77XiFJuIJJ
         39MDahQusQSK/4uJVxoxM3Ft4LtTr3UdCDSYO/jbj6+C5XU8Se3AZya361lEuLEYVt
         D0RRKjQTvDfOVURYezJrudZjB+Ti3TwtNkoVRCZKMqkvZYJziASqQ7/KYJmnsY2eUH
         v1oAv4TUhuBF9WDoZ19BHBAUbzam8NVDMvcqwckUzG5jk+X+f2ZtiBt60Oz5kdLfxV
         FX+spFBIRKNf0dYFenOzIKHuba8Aj4bxGv185glocTWFiqlO8pEc9xojja7jkjBt7x
         ADZo6D5Tlsvxg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] rkisp1: fix missing mbus.type -> mbus_type conversion
Message-ID: <c5048206-e835-94e6-574d-95ae4b971bed@xs4all.nl>
Date:   Wed, 22 Apr 2020 13:14:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF9KTLxZlLGSvZtYOYd/pqQp/WMH4zSyWKbQEk6s6EzqjbW+kC+fNuSIqVKvP03JL2vIxuDnOBLIe7XKwQua3XvDMyyGb1stCgc3zAhO2YvC2SzzFtVH
 r2Tx7dbz2Q3/I4PaHm6OIlwicBptmYU7C12uaE2ACT3XILZAINC1f2fo8Xa+jF4p9RvfBU1of4uYIR+/JEXc31tAF5euZ7GY9dDbLTt3yotSWm5/0jbs1jyP
 1gH0N+T/xs6WPRB6k8Kpe+u6KVCyB8OpbSrzb/FXB5w=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There was one missing sensor->mbus.type to sensor->mbus_type
conversion which broke the build.

I suspect this was due to a merge conflict that was incorrectly resolved.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v1: use a more descriptive subject line
---
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 61f159e59d07..dc2b59a0160a 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -291,7 +291,7 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 	if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 		acq_mult = 1;
 		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
-			if (sensor->mbus.type == V4L2_MBUS_BT656)
+			if (sensor->mbus_type == V4L2_MBUS_BT656)
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT_ITU656;
 			else
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT;
