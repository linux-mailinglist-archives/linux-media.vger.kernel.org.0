Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3CD500B49
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 12:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236416AbiDNKmk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 06:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233528AbiDNKmj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 06:42:39 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3DD6A034
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 03:40:15 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id B24271B001CF
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 13:40:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1649932813;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=m89W/tvO5qYMs4TpWTjQjFaV5w3GWGGT3Xe+hNPlVnw=;
        b=weE/CTs/4x0I1ptrof3Yr6r4byAFO97s+259fRHrM1Oy6OJ5A5ICZ9P/brnJb0b1xdPT3H
        sw7gALtkEoG1z5DRdy2WuYmbGhC0JoSyNIOXRAbJtlTb8WrGJdOHmpUkKs1TTp2bc69dXW
        qucZtOUvD1VJNr4TP6BXWYujJYOYxay/vlcuhtB5ZzxzRi4oYPakVQAIuhObo8aRVkOKFg
        TpsEZehm7gWcvAkMFPdZ4S6QFsnea62Eu10MVkeo4u0wHaKVo6NACifCLLuyLw+WewbeqZ
        rBms7IiLFIsOcGZaQ9o/EnmWSdP4Nm7cbKO0//iaXo4SopYXarT/z1zYcVPaRg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 55CC2634C91
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 13:40:13 +0300 (EEST)
Date:   Thu, 14 Apr 2022 13:40:13 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 5.18] Isl7998x dependency fix
Message-ID: <Ylf6DV9BjNd1Ywsu@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1649932813; a=rsa-sha256;
        cv=none;
        b=R10US+ySmkrnl4pwCiFfSBohtkqVQLRbQWEvSOp1AYwEeolCBVKdZad57H7npCMM3ARern
        +krXJ4Bk/auE99O5lYzHaSx2E8AWdATGmk2BQfqb8r2FGzTWMXHV/uogF3CwftkBQ4vS4l
        scqNPli+we9bQBbHQqwmUj6ugQ4ooxa8/CybcyBklZ5rAhpYE4VC/2FjADaTVrsVnSFieJ
        WV6hNnXpogRyEEvV0vr8TZ9dMwpOQq41LqXn+NrV0EQ1yMSTlzV2S+h8F2MDA8XtArzmyf
        XLNmAYtbzKKdEfhOQgp7L5cIAKhcn5rqzoTUM/mfr2TsgOPDd5PUpjv0VmQSlA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1649932813;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=m89W/tvO5qYMs4TpWTjQjFaV5w3GWGGT3Xe+hNPlVnw=;
        b=YWCsjJ+CWJe6lkEwJmVnY8Uk6dr61PUFg2MOHf4yIAcWTO1Qff8/4pKxbVKtyXLkPU2JBv
        6ycCkB7OfQe0gBj2Hb73GV3xEEEdDEn1to7nFR6yGfz1gJmP2WPGjsmep/VLSzXsdheVQW
        m1utjY8sTuNuPMUOqO39IAirzFhlNZtfaU5+RNnul0bqoZJs2hhDm7e+y77SwdPthRQq1/
        qycZYCxLwMnoTcKNSiuMftCww1JlD7d3GF7egKiwa5Yjd+S4KukatABhzXl/x52JtG7GC0
        +HtLUiXeO7g+tNdj77wbUJAtX1oBlOAZKn15uzv/ab9Fx7zFXM1qI3p2nzEmJw==
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

Here's a single patch from Randy to add V4L2_FWNODE select for isl7998x
driver.

Please pull.


The following changes since commit 3ae87d2f25c0e998da2721ce332e2b80d3d53c39:

  media: si2157: unknown chip version Si2147-A30 ROM 0x50 (2022-04-09 17:45:49 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-5.18-1-signed

for you to fetch changes up to 45ef624c2b08861d1567fc0c88840525e38ed729:

  media: isl7998x: select V4L2_FWNODE to fix build error (2022-04-14 13:37:32 +0300)

----------------------------------------------------------------
isl7998x fix for 5.18

----------------------------------------------------------------
Randy Dunlap (1):
      media: isl7998x: select V4L2_FWNODE to fix build error

 drivers/media/i2c/Kconfig | 1 +
 1 file changed, 1 insertion(+)

-- 
Sakari Ailus
