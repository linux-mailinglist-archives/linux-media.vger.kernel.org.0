Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2FE5A0DB2
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 12:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239249AbiHYKRE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 06:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238583AbiHYKRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 06:17:03 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94ADC923DD
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 03:17:02 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-f2a4c51c45so24283161fac.9
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 03:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=hCRitVOw7733akPjJ84kjX+62WI7PTT6nLCQQboPxyt/Zk1wQFWh2CLIwSb0wsMpqB
         KWlmcRsM37HFk87hg4ZnfzXZRs7MOJ1C27NLitEc+yhb7j1x1xgJDjPYPY2KYgmXTRcW
         M4qJJ7FALqlT5c8rEE62NqZNuL3BlSaBruKBCLF5Ez+8N2GGsR6o7SECUFKVo4gFMXab
         wOdd7q9Icg117ZBl1e39+BZ6iNDNT8f+3q/KIWSvBstMicgIdTnCRHh2JFf9Fq3G2yfl
         SmQm1Y/hzajnT+6ruaeCwVzYZzP/eb5YgdhLHj+pfXgzZ6b6Ya2GLhFZjHpiCHgZt0pd
         3foA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=u++baqWi5DIpJlkw9deQF0Q9kK9Og09sEgAv3VupF14h5flji754CpFq5n/GqTVNTZ
         n6QU+6CGKdyeSPkYiBnbPZPjSs6P4Ph9bj6R9HPC1e+Rs50zZ5UUVa3vvS8V88GcQs25
         848tAnjDdmFuna9Nsg112mS36+m7A59txV3ft4oDO4z9r8WW2XXfzVWDH2EnfeEI2DPF
         1JyBywZOzS36QQmPAW91dvZnBSaZDEWuOXUUpPs8t7SkhGZEx7bfi8WepmBaK8AElG/a
         Jd3oKo9whafTXxTD+N8qZWeOCQObgKsPmrS7ewyqAIQA+vbE48XgtDGp7w3ITDiMGqic
         Gkyw==
X-Gm-Message-State: ACgBeo0rPOcexdjXEZNCxogtOMy/g2V5p68/L7ZkvXXIKNrzl2AgrVeX
        CTdJBHP7f+JVdFchsKUQyVWNI4Pg1po6UPfTFIk=
X-Google-Smtp-Source: AA6agR5iS0sAY6uQa0L5J/ssI5+ZWnEZaH3qaK6PIMveRpk3GML6whqcCpEAnHLBYWpw7BzzoShlnUlgcxafBteuJRI=
X-Received: by 2002:a05:6870:4302:b0:10d:c587:d30e with SMTP id
 w2-20020a056870430200b0010dc587d30emr1640966oah.28.1661422622001; Thu, 25 Aug
 2022 03:17:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:5ec3:0:0:0:0:0 with HTTP; Thu, 25 Aug 2022 03:17:01
 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   kayla manthey <tadjokes@gmail.com>
Date:   Thu, 25 Aug 2022 10:17:01 +0000
Message-ID: <CAHi6=KZUjC+hF36WNx1JXY56DKheMhWM2-efYOFUv7k49U1tYg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4974]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tadjokes[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sgtkaylla202[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Bok draga, mogu li razgovarati s tobom, molim te?
