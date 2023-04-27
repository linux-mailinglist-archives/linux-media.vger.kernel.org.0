Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 238AD6F0C69
	for <lists+linux-media@lfdr.de>; Thu, 27 Apr 2023 21:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244555AbjD0TQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Apr 2023 15:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjD0TQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Apr 2023 15:16:50 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FC21BCC
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 12:16:48 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1a66888cb89so69054405ad.3
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 12:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rethinkbizservice-com.20221208.gappssmtp.com; s=20221208; t=1682623008; x=1685215008;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J3OdwHSbEKh120yKYqPXOlZHz3A9jgXVZSPwKLOo6SA=;
        b=ZOl/0Xq+Sott9Vtg2R05em94KhD7MdOeOsYyga2R2dOK4h/yzLvZcfK+wv5aueQMry
         RfbyikWmNa0n4cp1OE06haaGWvtxmtBr2IsDDFiQEwmFHbLGg9rRwgbKvlrCT7UX6gr9
         uOUVP0bBJXDEoh5Tb3kg83fZGl9JJ+t+hAbJstFJ4+DOv3RtLnc4EsJ7X4evsbq40BR5
         dKthpG1rcNv/YazX9t+7njKwaOAwMUdVNx2ncZ8Wk6U0dVT8XX9xeKfdLgoIilUyUvGD
         sFd603ER7Dwye1UObnoeo9KvnpAYcSe+kTK4hdUHHXRDgsQX6wdCGDA4CE3KfdDK2xN/
         cZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682623008; x=1685215008;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3OdwHSbEKh120yKYqPXOlZHz3A9jgXVZSPwKLOo6SA=;
        b=XenfsEY7JeVU42fxdX4qqFjnXyP4Y6PvQr7IzSRxwhBBXzetDrq52eabSwWFXv3DZH
         iNwWtNC3xjK4t+paLqhreu1vGSeWqXCies3INk84G79BtJUQMkXtsd1leXmHC0s74VZD
         /KfcETciHGRc+z5nDniN/asbiOpbUW5nVRwq8ieV1BDRB10VsJ3vIBeFjCKqzv7fLw5y
         DzHMpthtp5XAT/i4PKU9xDSDig2XlcB4LJ+3nr2Yi9VDG7QgzPFtm2eeWL9/R44xKByt
         CR/k0j2Iv+HIh1i+itIMSeXLlBnri+/BaWyftTLxaY3PKaPrp0R+eFNIWFNQxTVHqfHz
         VfKA==
X-Gm-Message-State: AC+VfDwdTqZtJar7QJgbf2wAWutEon1c5rgYiIt3ATpWe6Sb6YKy60r0
        1mWJ6js/wGT1kd1BQDsxnLs1LswneFPPOlfog8Pnjg==
X-Google-Smtp-Source: ACHHUZ7KQtbdag6EfXcAf7myb5KCK0BUvOBnfitTrDDrYAW9wxqp2aVYWudhPuMWJIUNEQuO/um1t/4CZiONqTRpcYU=
X-Received: by 2002:a17:902:ecca:b0:1a6:4127:857 with SMTP id
 a10-20020a170902ecca00b001a641270857mr3249631plh.5.1682623008181; Thu, 27 Apr
 2023 12:16:48 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Taylor <adam@rethinkbizservice.com>
Date:   Thu, 27 Apr 2023 14:16:36 -0500
Message-ID: <CAG5wPR7snWQ3zhJdG6=hMh5HuwyaZFFHyj0O_gRdeOitG6VQ4g@mail.gmail.com>
Subject: RE: Retail & Grocer Trade Shows attendees Email List- 2023
To:     Adam Taylor <adam@rethinkbizservice.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Would you be interested in acquiring Retail & Grocer Trade Shows
Attendees Data List 2023?

Conference                                    Counts         Cost
NRF Show                                     34,458        $1,989
Shoptalk                                         9,850          $1,489
Retail Innovation                            18,525        $1,689
National Grocers Association         10,525        $1,489

You can acquire all the shows at discounted price of $4,289

Looking forward for your response,

Kind Regards,
Adam Taylor
Marketing Coordinator
