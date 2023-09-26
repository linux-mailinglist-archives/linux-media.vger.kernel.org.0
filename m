Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 169FF7AF156
	for <lists+linux-media@lfdr.de>; Tue, 26 Sep 2023 18:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbjIZQx4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Sep 2023 12:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235401AbjIZQxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Sep 2023 12:53:55 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49714E49
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 09:53:24 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3214d4ecd39so7928741f8f.1
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 09:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695747202; x=1696352002; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1IgTMU3y3/4bU9px1NknGdY3yl6c/SpdYC5EoAFMcc=;
        b=X4NBwrB3xEfFPkfmx3S0uOi8VaXcWTCiS15J1w5IxyQsD9yTBQm0KhBHLw8L8es0QP
         mzR/5jWKumnm7IOi9Q6LBTRcyoOlptw+oCvFRQugjDlfqr08lpooXEFuVWkPkap9Qbra
         gMsSk/6vPT8zt6fTFwfivfZ9yU7JQNE6Sfx0EeCuDiOxmIa7VdXh2ktGs0JoMqLpRvil
         QPAg//g7QTiWEPpZaFfmHuzAhu7YPuQxU7JN0l2AtU8X8LRUjiJ8y4e3ga5E4JNRkUY8
         S8QA+bYQeevQBiITU2Y5giEl2bL331WgaCVj3+ByDTdN0OKPh3e0xTpqBn9lXAXTWiGY
         wCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695747202; x=1696352002;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1IgTMU3y3/4bU9px1NknGdY3yl6c/SpdYC5EoAFMcc=;
        b=PqONYKCHv37qSI1Ffm90yPTqaij2mR3cUk3+y8y2qEBnKDbHLU32Ye72O1o+ehhLIY
         9tMldNwWAUUDjLydWzmqHJUiFNwzMgx47uz+IfW0efZZ7jDzvh2mqGl6NNaycmR8HmJO
         qBymSE63P0qV4+/3TuIJkEhgb+sGBHYZ8/CS7FBXz7DaoKz6GdMCRxJv+uGzPdD3Ppgo
         /2kBEbWMZcPjqloVGiRBkPBe44GZVq6IIvjARjVex5aSB2NTHwJkk5s+CcN7bX3+snNG
         2c95ZOQ5YAQhEw55HQvx5XUXuKHWgvc9//NyWZ6ZNM6vnjtoZMgXngWYrhGH6fxU2vfK
         pjUg==
X-Gm-Message-State: AOJu0YwthPPgyJQyr5sluKFNJClGvd+rJpyyO2XJnAVF+rnTpjxz+3v5
        f+4WEyx7ny7o16L6vdt+dXNriPd0TzWjJqrwNsM=
X-Google-Smtp-Source: AGHT+IGpmFQyEKih6M+I4evDQOBd7r+McBOSZyKCNT0UB/DrM7QdWhKgad3SsIbswxDlI22Y2wgHGlEhyKqrgTCoouM=
X-Received: by 2002:a5d:4682:0:b0:31d:c9a1:c538 with SMTP id
 u2-20020a5d4682000000b0031dc9a1c538mr8917330wrq.35.1695747202695; Tue, 26 Sep
 2023 09:53:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6000:1f0f:b0:31a:ec06:3a49 with HTTP; Tue, 26 Sep 2023
 09:53:22 -0700 (PDT)
Reply-To: tchalimbenson@gmail.com
From:   Benson Tchalim <bnhat3121@gmail.com>
Date:   Tue, 26 Sep 2023 16:53:22 +0000
Message-ID: <CAMZa9cFDO7_7DL72CYoRAqan-=RcQUYbzY1Jarpa1w9wLb4r_g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

-- 
I wrote you a message but no response from you? What happen.
