Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5D25EDEAC
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 16:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbiI1OWX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 10:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234382AbiI1OWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 10:22:17 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7132A9C0E
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 07:22:13 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id dv25so27409926ejb.12
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 07:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=yCTn0U8DP3II5MSOB56dklbKRKTXd40BgLJDEI4Tqqc=;
        b=mXsGXdhzQi7d0uo4BfD7MILPFpyVeTfdP+axZLoJdP5pMz/4XBSui/im0lC96rLY9O
         I6qOa25Sl/axxi6l9e8uLlTS3FooLzleupYFePWHhnAzAo04EM3Qc6ELE+4Bjx0ly4cd
         OnlHpHqLqNUpyD0jfdC1zifYNhQOMpZbVs650Rz6+VUx5kDgE4IBh9OJnXNMnQoexe3G
         +44hffn+Nr4Iw92fgw8OiE+uK+IfuysSFK89H29oVddf0A9nyNWo0CfNpH2hN/zUHhN+
         +kMi844xG7blkF8YMstXuHP7M/RiFbLTDWWV9+HM8WnAo/FNDR6aCuJLp9Uk2NtFmEwW
         xJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yCTn0U8DP3II5MSOB56dklbKRKTXd40BgLJDEI4Tqqc=;
        b=3vD7xOTgFXRUMhLxCymOzEIxIFvKwnZ0Gdu9E+FYzmyvk0LL1KZ8CoLwcDBLzzWZLB
         BT0uMYsX3SXcA7un2dHC/glNFy15nJRveUTwn8tJ8HEx2BYceg+WmgXzWHTHjhrdDXBY
         zh5V/5eJTH9X2MP8nEoU6OujwvEkiNAM397BLEdLYqOBP/kwk9Y4l8Bsy/8SXx11IwqF
         AVgnVI3sDxm6eoneojGWZH+R53d9tLJfTW3Bhx4v0M5P/jXPTjk/3TJo+zZnstyBJJJu
         IonMoBL+GjK977cYjouac0+jWkdraZ3NEPCuGELN3AyLrPgJsxRlXXJa0J066gb078Fj
         jP+A==
X-Gm-Message-State: ACrzQf3Gk5r64GqrzV0u1C262fIORQhKPxOUt+pDXLKbsbOXzTbAgiC9
        OJaNIyXii4/5zPYvCXiZxU5CLjQ8UyNKyZ+VWC0=
X-Google-Smtp-Source: AMsMyM5Krjw6yYYB+TZDi+enIFu8zHJUBsaPJ+CQeoCZXrC5xlzS+/PajYtmYJ2pY0ujJGEfajrjU23UbnKrwzyhCJY=
X-Received: by 2002:a17:907:3e93:b0:783:d969:f303 with SMTP id
 hs19-20020a1709073e9300b00783d969f303mr10125422ejc.379.1664374932297; Wed, 28
 Sep 2022 07:22:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:7804:b0:783:783a:160f with HTTP; Wed, 28 Sep 2022
 07:22:11 -0700 (PDT)
Reply-To: rosedarrendr@gmail.com
From:   Rose Darren <chandjiekpon@gmail.com>
Date:   Wed, 28 Sep 2022 14:22:11 +0000
Message-ID: <CAK15N=tHwGw06_e87daNrMMdR=g3N_DJt8nTSd=gJpO7y7kcBQ@mail.gmail.com>
Subject: Hallo
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Liebes, ich habe dir vor ein paar Tagen eine fr=C3=BChere Nachricht
geschrieben, aber keine Antwort von dir, warum.
