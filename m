Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 899B8797B6B
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 20:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242208AbjIGSRa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 14:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245018AbjIGSR1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 14:17:27 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FDE1BC9
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 11:17:05 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68e403bb448so609233b3a.1
        for <linux-media@vger.kernel.org>; Thu, 07 Sep 2023 11:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694110624; x=1694715424; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xFgjhHy/2JnRY+iTJV04tePwcjJ6gL1tgJmyA9T3rvc=;
        b=TuzfnXIe6kVmekd/JI0Ldr6R6qjGELI6uJCvbqJIV6m6H0M6M4N6RtfTIO/MJEgn8P
         Bdrtd8NWQmluwdJ7uQSugfxDYmiXGsBEHlsYc1jxWeuETdg3iFyJnDnoU2vvnAeMaaEb
         dmcc7nIf60UUOzzIHMcNG6NpABOYATY4d6x0YLeuS02GejUhxQv1lLFTePDDgODOy35I
         y3u8KS+i9Axnfpz7+WFmUPbwivXXenzz75VR60Cr41pWop0SGl/M9T1LeL0QEbluvKu+
         VeAhmAh+aBXo6puiB8GruhvneTd1XDcPrGznuzUPBWm5AmRhI4cFfyhmNueTjUwSfy3Q
         xnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694110624; x=1694715424;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xFgjhHy/2JnRY+iTJV04tePwcjJ6gL1tgJmyA9T3rvc=;
        b=BZfUQyAHnGbrjl3oyJcW+Rqs3jWcgz1X6vA5Qk1yTP+1cyJ0fI9EdoeK2+zs0DJT/N
         30j8SAXRlicvcruhqVp4QfPx16RIQcOqn+p3h/taTD+EkKORzFshgKhBOmSKAdEUzrE8
         2BZalFBmmlv5VPBTSWL0NlpZS/KmPwOCX+67huOg2KoOIBHldqhiqyJOc7qWtfVLdNdr
         AY9Tuw2ZKVZAg6b7r62rDbNsl1wvwONCZkVbfKplUlJJzwWm2xFt2RY8ifKRWvyvX1AG
         3fsaAOqlopHJWsAX+l+AMeHG8mg/MufbdMibtjXOpvjJKebdz+J5hlU4R6dVXVQaRg4i
         bYnQ==
X-Gm-Message-State: AOJu0Yys5HEvW5m1boJ7fEG9YJJVs2CJXhf/0k7aBgc1f8CG6JGCSIAN
        O53xHM8tqb9aFH/IDGAL92PdZ6W/pIujDG/B1to=
X-Google-Smtp-Source: AGHT+IH381nmlp7HnR5Iv8xDSq9DqHdPd4/AQ9Yq5Ygt/yDCmNENaf3Fr6o6WBdPlarwKWb+hDGZ0LG7Fz7dCYWNtcI=
X-Received: by 2002:a05:6a00:4196:b0:68c:59cb:2dd9 with SMTP id
 ca22-20020a056a00419600b0068c59cb2dd9mr4391918pfb.1.1694110624288; Thu, 07
 Sep 2023 11:17:04 -0700 (PDT)
MIME-Version: 1.0
From:   Lisa lee <lisarealmarketing07@gmail.com>
Date:   Thu, 7 Sep 2023 13:16:52 -0500
Message-ID: <CACxyjTGHpN5duzJ5N1wucYON1e1=UG8pSJxXv1zHe3YJKcoHLw@mail.gmail.com>
Subject: RE: National Association of Broadcasters Attendees Data List 2023
To:     Lisa lee <lisarealmarketing07@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Would you be interested in acquiring National Association of
Broadcasters Data List 2023?

Number of Contacts: 40,198
Cost: $ 1,818

Interested? Email me back; I would love to provide more information on the list.

Kind Regards,
Lisa lee
Marketing Coordinator
