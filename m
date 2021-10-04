Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743EF420AC0
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 14:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbhJDMVM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 4 Oct 2021 08:21:12 -0400
Received: from ni.piap.pl ([195.187.100.5]:51922 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233194AbhJDMVL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Oct 2021 08:21:11 -0400
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: v5.15-rcX regression: video devices on i.MX6 are not created
Date:   Mon, 04 Oct 2021 14:19:17 +0200
Message-ID: <m3lf39nfsq.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Saravana et al.,

FYI the patch: 6b2117ad65f1bca9ece6d4b1ee784b42701a2d86

of: property: fw_devlink: Add support for "resets" and "pwms"

Allows better tracking of dependencies between devices.

 drivers/of/property.c | 4 ++++

breaks v4l2 video devices on an i.MX6 CPU. The /dev/video* nodes are not
created, and the drivers (async subdevicess) are "waiting":

# cat /sys/kernel/debug/v4l2-async/pending_async_subdevices

imx-media:
 [fwnode] dev=nil, node=/soc/ipu@2400000/port@0
 [fwnode] dev=nil, node=/soc/ipu@2400000/port@1
 [fwnode] dev=nil, node=/soc/ipu@2800000/port@0
 [fwnode] dev=nil, node=/soc/ipu@2800000/port@1
imx6-mipi-csi2:
 [fwnode] dev=0-0036, node=/soc/bus@2100000/i2c@21a0000/camera@36
ipu2_csi1_mux:
ipu1_csi0_mux:
 [fwnode] dev=21dc000.mipi, node=/soc/bus@2100000/mipi@21dc000

Reverting the patch (or commenting the "resets" out) fixes the problem:

# cat /sys/kernel/debug/v4l2-async/pending_async_subdevices
ipu2_csi1:
ipu2_csi0:
ipu1_csi1:
ipu1_csi0:
imx-media:
imx6-mipi-csi2:
ipu2_csi1_mux:
ipu1_csi0_mux:


What now?
--
Krzysztof "Chris" Hałasa

Sieć Badawcza Łukasiewicz
Przemysłowy Instytut Automatyki i Pomiarów PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
