Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE3D64B020
	for <lists+linux-media@lfdr.de>; Tue, 13 Dec 2022 08:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbiLMHDK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Dec 2022 02:03:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233761AbiLMHDJ (ORCPT
        <rfc822;groupwise-linux-media@vger.kernel.org:1:1>);
        Tue, 13 Dec 2022 02:03:09 -0500
Received: from pamir.pedago.fi (pamir.pedago.fi [194.112.9.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959A664D0
        for <linux-media@vger.kernel.org>; Mon, 12 Dec 2022 23:03:07 -0800 (PST)
Received: from GW6DOM-MTA by pamir.pedago.fi
        with Novell_GroupWise; Tue, 13 Dec 2022 09:03:03 +0200
Message-Id: <639823A00200002800123B26@pamir.pedago.fi>
X-Mailer: Novell GroupWise Internet Agent 18.2.1 
Date:   Tue, 13 Dec 2022 09:02:56 +0200
From:   "Anders Gustafsson" <Anders.Gustafsson@pedago.fi>
To:     <linux-media@vger.kernel.org>
Subject: Has anyone got documentation of the Conexant CX23102 chip?
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is sort of related to my other question as this is where I am stuck. The CX23102 talks i2c to the tuner.
I can see where the i2c pins from the tuner go on the CX23102, but without docs it is impossible to know which
of the three i2c ports on the CX23102 it is.

-- 
Med vänlig hälsning

Anders Gustafsson, ingenjör
anders.gustafsson@pedago.fi  |  Support +358 18 12060  |  Direkt +358 9 315 45 121  |  Mobil +358 40506 7099

Pedago interaktiv ab, Nygatan 7 B , AX-22100 MARIEHAMN, ÅLAND, FINLAND


