Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 576D4616350
	for <lists+linux-media@lfdr.de>; Wed,  2 Nov 2022 14:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbiKBNEK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Nov 2022 09:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbiKBND6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Nov 2022 09:03:58 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A361A052
        for <linux-media@vger.kernel.org>; Wed,  2 Nov 2022 06:03:57 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3691e040abaso165439497b3.9
        for <linux-media@vger.kernel.org>; Wed, 02 Nov 2022 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77BwqRII9XCweQU8IJul6unijI/BEL+vUJmVmCRLxH4=;
        b=RJYQoz5wseFrM8zLE6IWFzdNFCkzVE0J1VTVU+/hiO+zAREn/uaVOy8j1upaZ5Waec
         RJL9rxSR9LVwP80gfgx9Or/LdI9vWNPoSbcTgmblnLY/iNfTBG87tl1b+X8xRXOzGhM3
         gwYIgrhLIarRIcb+Ee2YP/iN2kxoOUMj4FNNH8RoG9dFijiBtk4vuvUauxo3JqBDQ0RT
         eMI/psFK4nFqhvOKA/mr9qXt79tFlfgfRuEIom88ceTfm+u+cEFcA5qrsaWDVZI9VIzI
         Po46U3jk3B153oRInkSNar8b52t+1/919L6XOGyrPJEj3dixZVs5CsLoKkFmNXkRWfi9
         Iy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77BwqRII9XCweQU8IJul6unijI/BEL+vUJmVmCRLxH4=;
        b=YRULu8/FXdeyppXgAbbrNJIxp/rZSFOLH89VDOdgJvGptmM+t1534/lM3TqW4yVKZW
         G5qtBOMHJthr7fMfAxk9QCQWFuC8L5S5X73Dm43HWEzx6XFaAkSDgAt0Dfy50EOSImCZ
         nRX+ztWtb82hKZKgRd08Lw7hWa/CglHS45GcQx8Kv0nawp/Wmn1ioeDfQbru0dhr+R6r
         WT7ZJDQs8jiJImwLhht57srURS92ZE0ZB4Zq9mLOh5mNkHgamoApDFNm1IYmBWXwBWYs
         C30CmCYjfcPMWmIG3dZLzPKTVzBUGy8pp9c0B55pbLy3/ONh70T7XpIChtcQv0ThUxZf
         OEVg==
X-Gm-Message-State: ACrzQf2kFdv1HNyfui231+gvtK4D7zqqJ0O5VPOBn7yzrA3Mu8a6b7kG
        KipfEyzBoTNeRM92JiZSYA9I+VdtfGWPbA7KZxs=
X-Google-Smtp-Source: AMsMyM4T+fhTWn9q7igp4aGvYfwZ3yAP/Z+UOHc/8mftt7hReuoSbeepdBRQZVLee8kz0rPtiDk6GMR8JCVBwMiLBvQ=
X-Received: by 2002:a0d:cf87:0:b0:355:e14f:1b8a with SMTP id
 r129-20020a0dcf87000000b00355e14f1b8amr23222153ywd.214.1667394236827; Wed, 02
 Nov 2022 06:03:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:17c5:b0:3da:1e36:e3f4 with HTTP; Wed, 2 Nov 2022
 06:03:56 -0700 (PDT)
Reply-To: rihabmanyang1993@gmail.com
From:   RM <awibrahima34@gmail.com>
Date:   Wed, 2 Nov 2022 13:03:56 +0000
Message-ID: <CAH=ybGEwYvHXknurMaDXS--ESWm2VpTfGHQpJKh75WyVVWLtqg@mail.gmail.com>
Subject: HI DEAR..
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:112f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [awibrahima34[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [rihabmanyang1993[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [awibrahima34[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
How are you?I am miss.Rihab Manyang i will like to be your friend
please write me back on my email for more details, Thanks.
