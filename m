Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4489E6F1B5B
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 17:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346367AbjD1PWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 11:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346155AbjD1PWP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 11:22:15 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884D959E3
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 08:22:03 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1aaca0bb8c2so787215ad.1
        for <linux-media@vger.kernel.org>; Fri, 28 Apr 2023 08:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682695323; x=1685287323;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=AvOV4Uf4Z/YmS7HX5YNlvSOk0YxGLYhaW70VBwl7+fY=;
        b=RrzP5tsjF8AUpxK5yCN0eFJUQcERXMkU/4c9z6uBd4LZTxI4DNoAPNr3MTv8sMIiyh
         QrnrUvMtLk2phiUd8ecWFvumX47Fi1Q+OBdcDJrUlBKiZ+1J28d3fsAfEjpd0Qs5rABD
         7H4/ixXiHzTqmgqK/wYC7zpSfmuFKvyxy6FmK0jJ8lW4l70QBxLu2BiHDPcY71XJmoHI
         BBnFtZoV0yxDKtXZME8yLYmMHiMIQECr6qEGs+H477GTQIOHSLLUNCyFRXFVpre8y/I+
         VY0Vz02jYxHAlb7fDb0xebHK/wZ696VKUonmbahB9yKpcqiLfizNYOKV18qZOCGPWMNJ
         kIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682695323; x=1685287323;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvOV4Uf4Z/YmS7HX5YNlvSOk0YxGLYhaW70VBwl7+fY=;
        b=co08QcppyaxI1sVbkt2aml5AGX+q453XYtpUo8QV115myAx3l5a6hx/UuOFiIW7nYX
         2E8yoBtlc05WE45frGSamjhFE75CSqLJNJZa+S7atp5NPKmNMiLFaT+TMKaTfmwF74Ay
         CFdPYvFwWcZnln5jxEInz0OGzyHW3aHjRgETq6Uck0Q2zjI/z4pbgnrJXoe0VFW/mq/9
         Z38+LUXKUjWLLUYVWTxS0YPfvB2HsMgc7Yb8qXgCBinXkhqaYLt7F9SLQvsH/7k6/8yN
         lXmyFEdeQkgxRdDJmdu6FbL0NWtxMraIpNcA7gFLYNRyCSsSpvhxHT2Ok6amsiASde3+
         9u/A==
X-Gm-Message-State: AC+VfDxdBEHFcv6dfX3XYpSDuhc6m0/QUERcleGxmI3B531P+ILpxw6e
        hbvec5WgA1r+r2iS7DN7g27PkA==
X-Google-Smtp-Source: ACHHUZ4bt00sR5e36hcAQl7WmU8qfDIJ/R63MHUTo4mivA9jkSqS879/rYPgxv18J3KAqY2YEgglJA==
X-Received: by 2002:a17:902:d4d1:b0:1a6:e27a:8a4d with SMTP id o17-20020a170902d4d100b001a6e27a8a4dmr6992191plg.2.1682695323035;
        Fri, 28 Apr 2023 08:22:03 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id gv17-20020a17090b11d100b00246b0faa6b1sm13092013pjb.5.2023.04.28.08.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 08:22:02 -0700 (PDT)
Subject: [PATCH 0/2] media: nxp: imx8-isi: Two build fixes
Date:   Fri, 28 Apr 2023 08:21:54 -0700
Message-Id: <20230428152156.22840-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     laurent.pinchart@ideasonboard.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux@rivosinc.com
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     mchehab@kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These popped up last night as I was trying to merge in Linus' master.


