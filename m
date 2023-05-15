Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1AC702D00
	for <lists+linux-media@lfdr.de>; Mon, 15 May 2023 14:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241683AbjEOMpr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 May 2023 08:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241497AbjEOMpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 May 2023 08:45:46 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52C7A6
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 05:45:44 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4QKfH96vQNzyPb
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 15:45:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1684154742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=De/Vo8DD7V+EZxrHDlBjlm2W90YrDMSUGdakNLdhb98=;
        b=ueV1g8QD05dIb9DkrHW7wvIxcniGd3E80nBRiexapcngCsBXzZLBFCk+wtYWZiH9IFsY1K
        S8NP0tknD82mtlwqTSmO5nGD5h8dkilKpTmyLUlJeDcnOh0AmC/0ZQoNbN5KKlwF97dTrE
        XPKVIUNfGfOb8zJznLwgPaEY9kXpZtI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1684154742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=De/Vo8DD7V+EZxrHDlBjlm2W90YrDMSUGdakNLdhb98=;
        b=NocMBXCTHsLu9N/9/qmTZevnWZnVz/MlhSsySFBkRWAsM+jA6CfwT4x2itsk1XsOqxYgmi
        p5j4o9vxhpFJXRSw8uQXu78CP1E3e4ACsx12rfore+tafj0st6WBvnqqI6DjVRR6xIa4eA
        Nq0vhY+UxqOEOV7AJxbJGprblTTi6QE=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1684154742; a=rsa-sha256; cv=none;
        b=OAIE/QnLai7HHlHMJrXRmb/niUsj6+dOmogEtbdVuJuFEuzYH4Z0tVRXc5DTAdm5nROQzL
        bNBT7UW3xT1JKpG674m/cuQ+sqfjgRz+5ywEg1P8eWGe6n3SlwUvscs4SUdzWIh+9STFh0
        QigGN3BFi64DKkaJyMzb4KMo6zP3Q7w=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6CFE0634C94
        for <linux-media@vger.kernel.org>; Mon, 15 May 2023 15:45:39 +0300 (EEST)
Date:   Mon, 15 May 2023 15:45:39 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 6.4] Client capability field kerneldoc
Message-ID: <ZGIpc8VRwPh0c47I@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

This adds the missing client_capability field kerneldoc.

Please pull.


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.4-1-signed

for you to fetch changes up to 0d8e6aeab60ae2a91b904cb38ae997be2831b11d:

  media: v4l2-subdev: Fix missing kerneldoc for client_caps (2023-05-08 13:22:47 +0300)

----------------------------------------------------------------
Client capability flag field fix for 6.4

----------------------------------------------------------------
Tomi Valkeinen (1):
      media: v4l2-subdev: Fix missing kerneldoc for client_caps

 include/media/v4l2-subdev.h | 1 +
 1 file changed, 1 insertion(+)

-- 
Kind regards,

Sakari Ailus
