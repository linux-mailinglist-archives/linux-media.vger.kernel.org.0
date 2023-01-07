Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 043616611ED
	for <lists+linux-media@lfdr.de>; Sat,  7 Jan 2023 23:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbjAGWFR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Jan 2023 17:05:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbjAGWFQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Jan 2023 17:05:16 -0500
X-Greylist: delayed 385 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 07 Jan 2023 14:05:13 PST
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76BB3D1DD
        for <linux-media@vger.kernel.org>; Sat,  7 Jan 2023 14:05:13 -0800 (PST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4NqDcM1h9zz9sWY
        for <linux-media@vger.kernel.org>; Sat,  7 Jan 2023 22:58:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flowerpot.me;
        s=MBO0001; t=1673128723;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=bCKM1qgCdmmfPU6sRWcaGzM2Ieyu8NX/l7QeeOnwen8=;
        b=WMZm5EqYjE8Z6UlZpF5oOuJAn7pDArq9WzycQsyX8eiHZavAufdsGEKiuW1NXyBz390xvm
        3+hhXWzBJAEI5KdyGT9HdqrlOEo/ciO7TP9tFnCb0etOXXV7iHpYgiFc47QB+A5d1O1w/g
        GDBhuTGhN0euNkONXTnAH82ccI4WlRF7zuB3onsowfcgBh/agOAQq+BpxlQQ+abuRT/+l8
        tN8FUhwHduQVCBrdmEHdHTES2PnKRmsFCQekyV98kSUt+QyBsdqRfOEWoPYVL7zalqzeni
        AZsGnlKlWjTk0YO0toKonpjJzSTKD0MRf0YDgC9oBSxvP0O0uZeHrXFRxG2JhA==
Message-ID: <e9da9461-240e-f5b4-089e-378b85734632@flowerpot.me>
Date:   Sat, 7 Jan 2023 22:58:41 +0100
MIME-Version: 1.0
Content-Language: en-US
From:   Sophie Friedrich <lkml@flowerpot.me>
To:     linux-media@vger.kernel.org
Subject: Potential integration of thermal cameras into v4l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4NqDcM1h9zz9sWY
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello people,

over the past months I've written a driver for the Guide MobIR Air¹
USB-C thermal camera. The driver uses v4l2loopback and runs in user
space with python.² The driver manages camera state, calibration and
conversion of the raw microbolometer to temperature values.

In my research I couldn't find any mentions of a thermal camera support
in the Linux kernel nor the media subsystem, so I assume I'm the first
to ask here and we would presumably need lay out some ground work.

The current camera driver outputs the temperature in the Y16 format as
Kelvin * 100 (i.e. 28056 (raw) -> 280.56K -> 7.41°C). This allows for
further processing down the line with i.e. OpenCV, but has its 
limitations. Especially as temps of only up to 382.2°C can be displayed
currently.

Does it seem feasible to integrate support for thermal cameras in the
Linux kernel and more specifically in the v4l2 subsystem?

- Sophie

[1]: 
https://www.guideir.com/products/mobileaccessories/mobirair/data_300.html
[2]: https://github.com/tyalie/pyMobirAir-v4l2/
