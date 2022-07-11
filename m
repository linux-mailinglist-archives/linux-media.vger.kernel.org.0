Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4824356D4CA
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 08:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiGKGjS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 02:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGKGjR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 02:39:17 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2D4645E
        for <linux-media@vger.kernel.org>; Sun, 10 Jul 2022 23:39:16 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id F00722038B
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 09:39:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1657521554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=8pFSV+XTfaUJ1rOVcUfS4hG6FCg2+JZdXpOHqQJ+3NY=;
        b=wAM0O8o4FP9oOMUsY5YU56EzjkBNgB36M+0zTcw8BlvwQfdYt3XnQgRgmJTxMU2KH7rX2h
        NBJfHPqc8O6Yb6Vyx3V6ynSOhpZ4jL4zq+o9+4wAy+7HSJMCLqOMS+S1+n2yhhu/UXaqBn
        tkQlktNiV+zde8cytPZvwWGEccMpzro=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 51E7B634D51
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 09:39:12 +0300 (EEST)
Date:   Mon, 11 Jul 2022 09:39:11 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 5.19] V4L2 async fix
Message-ID: <YsvFj/0pP9sqM0N8@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1657521554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=8pFSV+XTfaUJ1rOVcUfS4hG6FCg2+JZdXpOHqQJ+3NY=;
        b=oz+3cMLMPQSyXbhyFqv2k68t24o+Q50Xt9Bokh78EnDuUbH+7KlW74bq1hO/cDpttfk2KG
        +m9lE3C8mLMIJbW6FVpa8g+l95IcCALEWIy2VAe5Dn0R+sT+5AU3JTScZUtaEj9q280Nx+
        5jFQTvTC1de7GpizuakJjSVCEduVTgM=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1657521554; a=rsa-sha256; cv=none;
        b=E05yf8KoJd/g2DQzNzyR9mfgMsSQvf/9feYv9dVBD9NdTP0MQQoKQKpDJii5ulDgHT09ht
        qadL761U4BJGJT/7REF6Np60tVFmjrWOJyD0MD5kTR8uzpY/M49MJ3/rs0b//BweUopQD2
        VolyQ7dEqoSt9FuVGPqtlQRZkm/Cggk=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a little fix for matching V4L2 fwnode endpoints. It affects
systems relying on swnode in particular, including non-ChromeOS systems
with IPU3.

Please pull.


The following changes since commit 3bcc2c1eade4e95ee494c30684d0157fba27c824:

  media: rkvdec: Disable H.264 error detection (2022-07-05 11:45:45 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-5.19-1-signed

for you to fetch changes up to 7a4eb72e63b88feac3de62ad299a29af5cedfd0d:

  v4l: async: Also match secondary fwnode endpoints (2022-07-11 09:31:10 +0300)

----------------------------------------------------------------
V4L2 async fix for 5.19

----------------------------------------------------------------
Sakari Ailus (1):
      v4l: async: Also match secondary fwnode endpoints

 drivers/media/v4l2-core/v4l2-async.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

-- 
Regards,

Sakari Ailus
