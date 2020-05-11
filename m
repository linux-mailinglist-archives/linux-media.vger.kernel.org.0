Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82BA51CE695
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 23:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729661AbgEKVBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 17:01:42 -0400
Received: from v6.sk ([167.172.42.174]:52536 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732306AbgEKVBj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 17:01:39 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 421F1610A9;
        Mon, 11 May 2020 21:01:37 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 00/11] Make sound work on DT-based MMP2 machines
Date:   Mon, 11 May 2020 23:01:23 +0200
Message-Id: <20200511210134.1224532-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this patch set reworks the mmp-sspa driver to work on a device
tree based MMP2 machines. My motivation is to make sound work on
a MMP2-based OLPC XO-1.75 laptop.

Note that currently the driver is pretty much orphaned -- it is not used by
any boards and nothing in tree provides the necessary clocks. This means
that risks of regressions are effectively zero; even though my test
configuration is not exhaustive and do not possess the datasheet.

I'm actually not convinced it would've worked too well if it was hooked
on (due to what patches 01/11, 02/11 and perhaps 09/11).

I've tested this on a XO-1.75 along with clk-audio driver that was
submitted separately ("MMP2 Audio clock controller driver" [1]),
mmp_tdma driver (with changes queued in linux-next), the rt5631 codec
and audio-graph-card.

[1] https://lore.kernel.org/lkml/20200511195534.1207927-1-lkundrak@v3.sk/

Thank you,
Lubo


