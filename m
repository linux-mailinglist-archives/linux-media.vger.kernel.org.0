Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC3174F57F
	for <lists+linux-media@lfdr.de>; Tue, 11 Jul 2023 18:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233333AbjGKQd0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jul 2023 12:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233375AbjGKQdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jul 2023 12:33:02 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DDBE60
        for <linux-media@vger.kernel.org>; Tue, 11 Jul 2023 09:32:50 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b69e6d324aso95001361fa.0
        for <linux-media@vger.kernel.org>; Tue, 11 Jul 2023 09:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689093167; x=1691685167;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VWtpptzPuOCoLkyZBw7yYHV5FeI36rJVjotbONsdA94=;
        b=WFibieZ2v0r4nWPy0J1wGTrFtOXxVksWo9Ycvtk6r1viqsBFsWV1+2Luw0tJWYEc2d
         EybaDJGcl9KBnd0R2+PpSfAnadC6cUCuzXIeMjWw73PxDtrOeheXj3MKd/apxW9S3ScJ
         Bl58mCaKB5LUAOIUynXr102zB7CYguU8HSAJLcDpZc+IWY8x5SiZcHZRkmcdW0/ue2oa
         8aXF0EdL9nkFqQ8NQ6NYa+DFo+gCiYHKk0xm586Z7LI3nLfD/P1f+sXgZTNlbdV9CQLJ
         zPkvhLIsOegU5GpzkADKnE1GLB+w6gcz5zA7aFFk4hLsPcOTQHM9yDbvmbKV8wZAXdVk
         LFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689093167; x=1691685167;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWtpptzPuOCoLkyZBw7yYHV5FeI36rJVjotbONsdA94=;
        b=MO8JVp1OBTLeglKNm01qYY2OBz4pLXLyGvRULbk7KrWbmtolIFgwT21pXh44XnYX+w
         IBqMoMoXIe11dVkhGRfHlC7MrFs5PeDp2WJrypGYbYfWTLeBz21xkFCJ9+ABr2n8+MqQ
         bqqLCV+ZjlCQbi1YheBdrZJz+RT+/Dpdf2rY9ZOYcRCEvcmeDNrlul6qnBuAIXNSJhqO
         g4+r/HVAlPiDnMx0TAQ0qsXkSNOnMm/dASoHM7ITV3YeEb0CbivL8wzhjJP3tYeWJbFR
         HBxkJCYcgODWKCK+D5h8OrTXDP8J8HMdVn11ZyxbQC4y6yygdvh8CIdpIEwqGNIvXmeS
         pDEA==
X-Gm-Message-State: ABy/qLZpv+1OBuT0Hb97Y1iXPipo0KjyXkw1zhDkhhvFjr/N6TrrUTio
        6+iqH1sFTkZaNgzBMK0o5iGDxyjafxOKr+jnepU=
X-Google-Smtp-Source: APBJJlH1If/svLi3ZvVSK9N5XCgAEROHhzB3qlp5M8M0oO6v2qngfJe3MewXHmdWauY1GePpYxisCh5XUDIQqNBIkDk=
X-Received: by 2002:a05:651c:120c:b0:2b6:fc80:c45f with SMTP id
 i12-20020a05651c120c00b002b6fc80c45fmr12883371lja.13.1689093167200; Tue, 11
 Jul 2023 09:32:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:1c16:b0:986:7a95:9cc0 with HTTP; Tue, 11 Jul 2023
 09:32:46 -0700 (PDT)
Reply-To: mrsvl06@gmail.com
From:   Veronica Lee <nd4846496@gmail.com>
Date:   Tue, 11 Jul 2023 18:32:46 +0200
Message-ID: <CAPadVRx=24t+dtCfxOJ-H_QTG0496dY-ZfFTyFRXoPSEnRePwA@mail.gmail.com>
Subject: re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

16nXnNeV150g15nXp9eZ16jXqteZINep157Xl9eUINec15TXkteZ16Ig15DXnNeZ15og16nXldeR
INeZ16kg15zXmSDXnteZ15nXnCDXkdei15HXqCDXnNec15Ag16rXkteV15HXlCDXkNeg15kg157X
lteb15nXqA0K15zXkteR15kg15fXldeW15Qg16nXkNeg15kg16jXldem15Qg15zXqdeq16Mg15DX
ldeq15og15fXlteV16gg15DXnNeZ15kg15zXpNeo15jXmdedINeg15XXodek15nXnSDXkNeg15kg
157Xl9eb15QNCteQ16DXkA0K
