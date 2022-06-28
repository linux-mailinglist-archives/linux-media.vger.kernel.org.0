Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 919EE55ED0F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 20:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbiF1SwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 14:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbiF1SwD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 14:52:03 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D562AC61
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 11:52:03 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id c6-20020a17090abf0600b001eee794a478so6191517pjs.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 11:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ayiugQq10s1YzbJoxctqyFeo3e/lH7sSw5jIUCDqfMk=;
        b=M1UTU5bVShguTzCmtWIy/OLaZZcnGeO+rAp87Hr4ZAhNBpXJwNLBMNDp/ls/WAygK1
         9MdJvmeFbSWMIBnvx5DOvLDaIyUqFLQo8DFnoV032Qfy0dkjsrBgYHl7jv88Jc5fKo4e
         919uyysgO0H0kg6sHKo5U8TsvOvG+2lP4ARKcqjUxvi02OyLzYXnScRIY11J/JHrHcFj
         VcjO6iFnEZk6O7JUs1fAhXTSNT8yIRVf/2wZIt5kjkhU2IFGU37mj6bqt1KYPY4VDOtr
         Os98mhIv7Zqx9BhbDTMTzeDt6yL5UGHffz2k/chK0iLb/x51zvXuVWxnxWacDGrtsZ8X
         dhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=ayiugQq10s1YzbJoxctqyFeo3e/lH7sSw5jIUCDqfMk=;
        b=3cnw9FuXAsVRNEOpFm7QCR2p+bgAQkauhNSJuyFSwhRzYKGlTeHO8Qeh6vUbPtAZkw
         JHPgYT/7rSBEsqRtOb5xO9/L8Bm2yiYMoiLeyEdQNiww52jYlJ28WxfG0R5o6R9K/SMQ
         ZRS0keFHBdMPxEX1gplxyxJENr06KIxiOqoos18PdBSQheCqKD4xGCyPDm/V0HpEwpnq
         CnzEQtIpFxbwXTjRAAM8kkAofGa9Etq6ySkNt13UvrbVortId2bzxlbCT6D2/y3cTz2C
         z1dlphlMtWTsTF3JSHIxh00Ngoeep9Et7f2AdV2RhKtdxw0pRU7he5m7+wmvW4JXSQ7w
         JMsA==
X-Gm-Message-State: AJIora9/4eQBmpvakEEaGhpWh6Q4VcSxzW4MEgp2OwVWkQwtLdoGWxhr
        6UXnJw1gGOkcucr973VWPPCXH0Hvjg+85lGSm6U=
X-Google-Smtp-Source: AGRyM1s+iZgsfrw6x3yDJmkFGtAJwE1OMA0zM/BioZ/laAGAJldPfG7aq5kAHCkbxHaLuntCUyLICEjXSDwGJNTJz3c=
X-Received: by 2002:a17:902:d212:b0:16b:9cf9:6523 with SMTP id
 t18-20020a170902d21200b0016b9cf96523mr187336ply.33.1656442322477; Tue, 28 Jun
 2022 11:52:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:203:b0:41:3e92:3fe8 with HTTP; Tue, 28 Jun 2022
 11:52:01 -0700 (PDT)
Reply-To: rkeenj7@gmail.com
From:   "keen J. Richardson" <roseibrahim1985@gmail.com>
Date:   Tue, 28 Jun 2022 18:52:01 +0000
Message-ID: <CAEJJipUXkJHDHB=_rnMC_7dXP93BTuwaBWhf9XrSm=_6=NaAAQ@mail.gmail.com>
Subject: =?UTF-8?B?6Imv44GE5LiA5pel?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UPPERCASE_75_100 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1041 listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8109]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [rkeenj7[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [roseibrahim1985[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [roseibrahim1985[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 UPPERCASE_75_100 message body is 75-100% uppercase
        *  2.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

LS0gDQrlhYjpgLHjgIENCuOBguOBquOBn+OBi+OCieOBrui/lOS/oeODoeODvOODq+OBjOOBguOC
iuOBvuOBl+OBn+OBjOOAgempmuOBhOOBn+OBk+OBqOOBq+OAgeOBguOBquOBn+OBr+OCj+OBluOC
j+OBlui/lOS/oeOBmeOCi+OBk+OBqOOBr+OBguOCiuOBvuOBm+OCk+OBp+OBl+OBn+OAgg0K6Kmz
57Sw44Gr44Gk44GE44Gm44Gv44CB6L+U5L+h44GX44Gm44GP44Gg44GV44GE44CCDQoNCueym+eZ
veOAgQ0K54ax5b+D44GqSi7jg6rjg4Hjg6Pjg7zjg4njgr3jg7MNCg==
