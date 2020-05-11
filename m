Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C77C1CE4D8
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 21:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729727AbgEKTzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 15:55:40 -0400
Received: from v6.sk ([167.172.42.174]:52448 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729049AbgEKTzk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 15:55:40 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id F13CA610A9;
        Mon, 11 May 2020 19:55:37 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 0/2] MMP2 Audio clock controller driver 
Date:   Mon, 11 May 2020 21:55:32 +0200
Message-Id: <20200511195534.1207927-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

please consider applying this patch set. It contains a driver for the
audio clock generator on Marvell MMP2 along with the DT bindings.

Currently the I2S driver (mmp2-sspa) doesn't have support for DT and is
not able to get clocks from this driver. The patch set to address that
will be sent separately.

Note that the DT binding validation is going to complain about the
example in it until the "clk: mmp2: Enable Audio and GPU on MMP2 and
MMP3" [1] patch set is merged. Not a big deal I suppose.

[1] https://lore.kernel.org/lkml/20200511192517.1206442-1-lkundrak@v3.sk/

This patch set has been tested on an OLPC XO-1.75 laptop, along with a
patched mmp-sspa driver and rt5631 codec.

Thank you
Lubo


