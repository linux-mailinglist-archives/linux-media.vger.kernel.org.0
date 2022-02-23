Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8891D4C07AD
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 03:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236746AbiBWCPh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 21:15:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbiBWCPh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 21:15:37 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138DA37A33
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 18:15:11 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id d23so28362397lfv.13
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 18:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=S3JtR5HtN5TgHtZRkOpXh8ju3yrdK90cRx1M8SbEib4=;
        b=o6JZk7gdQnvP5thiV36LdJ6yWfXjYNjN/H+vSP/Pjd31IfF34ML4YUwa1ug6dDcqBM
         XzB0Lzh+b7mYjsI3l4RIxu1mwNuxpLhHOGyuSBS3nc0PeA8DpZipI73InvpZcMbkO257
         aFlvnEIaEz+O4+L4YhLWZZvYfGEtoVUEjCNNY514nXdT8cp5cNCLNQoD5VzOsC/wgb+v
         iXzoIG7zXe2qzaQmOam00BnAi1ddyRHJWJrAV/CMtw+Ps5gGSKycMfbYGQ2HF+p30PHA
         eqa5iJi21hCwE3UM7pyIGYr4yxUFn5ONDKeRfpLIpqkddnkeuElOOX8CmDeWptETEw6d
         nJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=S3JtR5HtN5TgHtZRkOpXh8ju3yrdK90cRx1M8SbEib4=;
        b=ha2Io16GLqLHFgN+1lP2JItBkxvxCWO1/CtM1BGLilVOZ0BDgRYIJVh/qOXgPF7SnQ
         P5xcFo8/zUd0u3Ha5GA+YP+5DSFnnWzQfGceIYOslIxYxEg6aJbhmOZr/YjWDPqWhq+B
         CFN4PAUscKcojW4zopCz8GSZruirQ4eF9djualfKnHEZVjvy9ihpqy1JCfb3TdLhLIwM
         iTRx4G9Z/GvtJur802YWv6t+mLHK9wFWCDdXgUkbqJeT9tRDv2KbpiOR5BsWjWdNiQJL
         FD+OEiweibZH/ONzyjMqouhQcHO17tdz/muTxoda+RW0/UypQT3eRerxImC7T5lGQDpX
         ymUg==
X-Gm-Message-State: AOAM531/4+PqbJJnagqGzsG/olFS1kZvVWebJE1eBDLblseG/jWstvq8
        01lDb6fXgb5sWLfD/W5vbB8WlVVrL/sIks5y+yQ=
X-Google-Smtp-Source: ABdhPJyCxJgU/a1w7s9lM6+dSjZluEfhSHoY5A2K95oi5wdH7t67uw0plohv30aTQnfD1VuzWeJxyEmFWLllAuxo/4Y=
X-Received: by 2002:ac2:47e3:0:b0:43a:9d5b:8a9e with SMTP id
 b3-20020ac247e3000000b0043a9d5b8a9emr18327239lfp.67.1645582509455; Tue, 22
 Feb 2022 18:15:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:6f07:0:0:0:0:0 with HTTP; Tue, 22 Feb 2022 18:15:08
 -0800 (PST)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <xaviergbesse.2020@gmail.com>
Date:   Tue, 22 Feb 2022 18:15:08 -0800
Message-ID: <CABEvWU+7U17VozCEhf5UCu8Z5_JriSVOvPjhtp69ypbOF8qh9w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
Please with honesty did you receive my message i send to you?
