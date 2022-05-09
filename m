Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFC251FC7A
	for <lists+linux-media@lfdr.de>; Mon,  9 May 2022 14:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234018AbiEIMUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 May 2022 08:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233997AbiEIMUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 May 2022 08:20:36 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7E9DFF2
        for <linux-media@vger.kernel.org>; Mon,  9 May 2022 05:16:43 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id i19so26397514eja.11
        for <linux-media@vger.kernel.org>; Mon, 09 May 2022 05:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=7RcKw958Dwoxyv5P28kdPCejyB/j1UrEo/6eETvtZeU=;
        b=F7KUrTZVMsTfttF5sgWuvXMrGmVKochcRzCgz2oPzxX+vc7jO8bDeAL2LTVxGo5rrW
         LhqR4qWBTxqqffleTGZPIFSodBmCrF6wf+LLSj/xfRfqzGDAvUkaBFadMp4Wi1nqENBv
         JKgz/OVHW3v84bq3KfSTprBoArFT2JX2S5P/BHExM2CjSIzHc63CgT+eppfyeUXBoykF
         yKvKWyFcTPYWY9/zo9xJP0pxj973SHSP0vaqGDxtptryndHaafkRAdRBbQ28O1RGezWT
         MB+MblC3o4L182WddRADsgkTwa+zwxbuE0wiuEM/1L+HGvOglKOQ6qNzonjhhsJoAvHs
         An6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=7RcKw958Dwoxyv5P28kdPCejyB/j1UrEo/6eETvtZeU=;
        b=vSRr+8cHr5Esb72Ma8PKzmhREUEDdAjtpjr5/bcbn3Zr3H//p5BWYgH+SdKdwuYpZ7
         a6ACkW6ZjFn2mx/mnSx1xWjupBMDrJ6n/8kixXd37ArK2Dlm4ikwUPu/2rTQ4y0SFQgx
         YoKVdGirHdDiDi9heocjz1cI1cRR8pNxy6zq4/dVqyJElfbr5SKnPV+k1Pj91tdHEpIO
         h0/0BDKvocZS6o0Tkc+OBRjK9PlsoyOLEkqliEFu6TYdlZPMWYrlAz+/fm6jFZ7MWxBW
         h2Zr7mXz7+EXFVBcSYyoyiyCLOvMWnFMBg38+S7JsfBqQ4XjebPYO3dl+iNEdJwjBq9C
         kyLA==
X-Gm-Message-State: AOAM531YgtETXcHFUw25UGRhNOE/iRrOssRcJOEuklced+hFgHVn9mDe
        AvfR7WURHufwniCShgT7Gt5FATrd5aFKRcPu0Bk=
X-Google-Smtp-Source: ABdhPJx5AZ6hdGFvjBqLYeoaE9xD29pJippYZGnKf5DoYfk8lm5sI+1wYpMavQSODr0pBMoiAV0G4c6DnsDEjomVVjw=
X-Received: by 2002:a17:907:7205:b0:6f5:3f1:927e with SMTP id
 dr5-20020a170907720500b006f503f1927emr14089337ejc.739.1652098601672; Mon, 09
 May 2022 05:16:41 -0700 (PDT)
MIME-Version: 1.0
Sender: franklinlometogo@gmail.com
Received: by 2002:a17:906:7146:0:0:0:0 with HTTP; Mon, 9 May 2022 05:16:41
 -0700 (PDT)
From:   ueoma <westafricaeconomicmonetary.tg@gmail.com>
Date:   Mon, 9 May 2022 12:16:41 +0000
X-Google-Sender-Auth: eICRoPrhJwmOxU6Xxzu_V6rJjj8
Message-ID: <CAM7APZw_SaBG4c8SwqzmRT953MDfT70gAf1eh_Vfc0H_Psw74Q@mail.gmail.com>
Subject: =?UTF-8?B?0LLQvdC40LzQsNC90LjQtQ==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

0KPQstCw0LbQsNC10LzQuCDRgdC+0LHRgdGC0LLQtdC90LjQuiDQvdCwINC40LzQtdC50LssINCX
0LDQv9Cw0LTQvdC+0LDRhNGA0LjQutCw0L3RgdC60LjRj9GCINC40LrQvtC90L7QvNC40YfQtdGB
0LrQuCDQuA0K0L/QsNGA0LjRh9C10L0g0YHRitGO0Lcg0LrQvtC80L/QtdC90YHQuNGA0LAg0LLR
gdC40YfQutC4INC20LXRgNGC0LLQuCDQvdCwINC40LfQvNCw0LzQsCDQuCDRgtC10LfQuCwg0LrQ
vtC40YLQviDQuNC80LDRgg0K0L3QtdC/0L7RgtGK0YDRgdC10L3QuCDRgdGA0LXQtNGB0YLQstCw
LCDQuCDQstCw0YjQuNGP0YIg0LjQvNC10LnQuyDQsNC00YDQtdGBINC1INC90LDQvNC10YDQtdC9
INCyINGB0L/QuNGB0YrQutCwINGBDQrQvdC10L/QvtGC0YrRgNGB0LXQvdC4INGE0L7QvdC00L7Q
stC1LCDRgdGK0LLQtdGC0LLQsNC80LUg0LLQuCDQtNCwINGB0LUg0LLRitGA0L3QtdGC0LUg0LrR
itC8INC90LDRgSDRgdC10LPQsC4NCg==
