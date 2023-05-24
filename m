Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D61970EBB1
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 05:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239251AbjEXDLJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 23:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239252AbjEXDLF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 23:11:05 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3B71A2
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 20:11:01 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-96f9cfa7eddso63697566b.2
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 20:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684897859; x=1687489859;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLnE1viA2YkFQlIS735wdkGePat6D3JreXDWC7/8f9c=;
        b=eOBJcVuNV247zrye6ZjyPUzS0bdx38gKMY3EBI/PdUEIEoCUeF5OUwTEenXHz2fsGy
         cnxrvMiTd7kcGBT6lefvZP/MAoIFyfyIRkkAQXR+/NYf06NRuEMRs6ma4jxUWedp86Ey
         tZ34HkzmDT3+W9h3E+TP4S9oXOXfcmYaEGISP+IGpS+t2UpU6Ufg+bgeOSB2sjrdAruA
         EsaX5MOoUKpafK01pSo7gT62A06j0lIdJ6cbxgNBf08p2MG2ql+wcsRNmU39lu3+Hniu
         K+zXH+G6ViZ80tT0l7xHw+Wjt33mign78Vn49dc+e17AfB4VNnUNOe7yXTx4TcafSFXe
         rkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684897859; x=1687489859;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLnE1viA2YkFQlIS735wdkGePat6D3JreXDWC7/8f9c=;
        b=D+miLOdy5NocWkeVNNBfokYgohTDW6Lzpx7+jqNY4pwbqaWctyHQ9HfMyMJXG9UKKP
         0dT4yeDNAcDJY3VffIQlhpZ2LUxNlhZO+wfNXmC6+7/0w5ZqHe1UYzrypvIUeFxPqL8l
         V2EF7YkL+Ij+jP6B9vnqtNZ+iedRzkZtaUmDMKOpTCTYH36sVsl+PdYw90ln/GcNA/4B
         dlzGtHZ0A7WlDVUf1q1MND71LM8y5oCNaYi+JaN3DrXkMly0zCPVxkSmQK9frFzl/m7P
         w59dHfJM2HouAGPn1z+ijOFl+sdQJNpJSDZ0HTCBuEdfxY03jepDG2YEJW0MnaIVheZP
         osXA==
X-Gm-Message-State: AC+VfDyp/ti6okYge0j/SKwKhIAhHmTNIAfzWrhxiUs0v7AQ4KAm1Tqr
        GDVYWHaXAzCAf1xGZDroSu8HrIayLkdfbjiVk+E=
X-Google-Smtp-Source: ACHHUZ5dvGFng/6XXVLm7NfG4mKdK/kNn+V+VTSRfy3MpyeydWawW2UeIyBhsLhgnn+unAcmdrier38ZOZEmlGJbBy0=
X-Received: by 2002:a17:907:c20:b0:96f:9963:81ee with SMTP id
 ga32-20020a1709070c2000b0096f996381eemr14568510ejc.50.1684897859454; Tue, 23
 May 2023 20:10:59 -0700 (PDT)
MIME-Version: 1.0
Sender: luckyfriday51@gmail.com
Received: by 2002:a54:254f:0:b0:217:9224:304f with HTTP; Tue, 23 May 2023
 20:10:58 -0700 (PDT)
From:   "Mrs. Sayouba Athelah" <sayoubaathelah@gmail.com>
Date:   Tue, 23 May 2023 20:10:58 -0700
X-Google-Sender-Auth: ZoxmwvA6w_n327HrdPi8xpE4AvU
Message-ID: <CADF2d9PWH8F6NjtViedV_yuQBB7dhDgnUTvLrBr2gAYTqfqeow@mail.gmail.com>
Subject: Re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.6 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MILLION_HUNDRED,
        MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:644 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [luckyfriday51[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [luckyfriday51[at]gmail.com]
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  2.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear God's Select

I am writing this mail to you with heavy tears In my eyes and great sorrow
in my heart, My Name is Mrs Athelah Sayouba, I am from Tunisia and I am
contacting you from a hospital in Burkina Faso. I want to tell you this
because I don't have any other option than to tell you as I was touched to
open up to you. I married Mr. Sayouba Brown who worked with the Tunisia
Ambassador in Burkina Faso for fifteen years before he died in 2016. We
were married for eleven years without a child.

He died after a brief illness that lasted for only three days. Since his
death I decided not to remarry. When my late husband was alive he deposited
the sum of US$ 8.500.000 million. (Eight Million Five hundred Thousand
Dollars) in a bank in Ouagadougou the capital city of Burkina Faso in west
Africa. Presently this money is still in the bank. He made this money
available for exportation of Gold from Burkina Faso mining.

Recently, my doctor told me that I would not last for the period of seven
months due to blood cancer and hemorrhagic stroke. Having known my
condition I decided to hand this money over to you to take care of the
less-privileged people, you will utilize this money the way I am going to
instruct herein. I want you to take 30 Percent of the total money for your
personal use. While 70% of the money you will use to build an orphanage
home in my late husband's name. And help the poor people in the street. I
grew up as an Orphan and I don't have anybody as my family member, just to
endeavor that the house of God is maintained. I am doing this In regards to
my late husband's wish. This illness has affected me so much. I am just
like a living death.

As soon as I receive your reply. I will give you the contact of the bank in
Burkina Faso and I will also instruct the Bank Manager to issue you an
authority letter that will prove you the present beneficiary of the money
in the bank, that is if you assure me that you will act accordingly as I
Stated herein.

From Mrs. Athelah Sayouba.
