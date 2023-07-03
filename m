Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1760746408
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 22:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbjGCU3a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 16:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjGCU33 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 16:29:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A292DAF
        for <linux-media@vger.kernel.org>; Mon,  3 Jul 2023 13:29:28 -0700 (PDT)
Received: from uno.localdomain (85-160-45-219.reb.o2.cz [85.160.45.219])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2AA611A9;
        Mon,  3 Jul 2023 22:28:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688416123;
        bh=ntGL0G+I+YkFmIbNXJ7fHRsNIzy9WBXekFF6Q8qT0hk=;
        h=From:To:Cc:Subject:Date:From;
        b=RhO385Mp5WrYo0j6RqLyjXC4CQ165vNWnG4K+km5rNrdzPu9oV+NGUE64i1EGAtkL
         knWtFcSK+GylKWtd6F4yuRJPdtEKu3u/MpniopxlnRbJDN+jEnowBOBk17ldkoiumj
         SqNxaaWY9th8PvrrKCHqCzfGTcyp+uwGQ3EsDMu0=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 0/2] Documentation: v4l: more camera sensor doc
Date:   Mon,  3 Jul 2023 22:29:08 +0200
Message-Id: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Two small addictions to camera sensor documentation to reflect what has
been discussed during my presentation at EOSS last week.

Thanks
   j

Jacopo Mondi (2):
  Documentation: v4l: Flip handling for RAW sensors
  Documentation: v4l: Exposure/gain for camera sensor

 .../driver-api/media/camera-sensor.rst        | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

--
2.40.1

