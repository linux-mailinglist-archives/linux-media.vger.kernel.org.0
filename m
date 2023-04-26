Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 298FD6EFA9C
	for <lists+linux-media@lfdr.de>; Wed, 26 Apr 2023 21:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239005AbjDZTGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Apr 2023 15:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238479AbjDZTGe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Apr 2023 15:06:34 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3CB186B8
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 12:06:28 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-18ecdb1f2aaso483743fac.1
        for <linux-media@vger.kernel.org>; Wed, 26 Apr 2023 12:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682535988; x=1685127988;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=enjYQ1xRKll36ZQBsxot0VcX88RsU4QxjTsmFCXceCM=;
        b=Brzy77aP36Pkcpy8M+Rz5Y+JRiNEFQ7TnbaX4Yq7e+2jYU+m0IEIU+pQQ9qiWFQpGx
         x+2VL3iojsPBiVkD3UuaVI0/sQehxhkA7diN6ZcROPXsKtzb3ueyumegfxkD+UoilfEP
         cu5JlkMmza13VJDctE5tpNkOqoNLLrdPNGTmZdX/SCYK2K831rke6guLoQgPwhaIdwsS
         edJYq9GQ4vL/3yqTwwNN+PYLAmJtTrDIStWqfJaFQw+L4IK5NeDjRB7j2GB6DOsB94iD
         Hjja60lBWUB8QBvm26NEuAIgViCcsnUdNX7dnI+WG6dopANxZn+5BQR0fgyeMMZ2LZeE
         ebcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682535988; x=1685127988;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enjYQ1xRKll36ZQBsxot0VcX88RsU4QxjTsmFCXceCM=;
        b=QtoxxZ6osTexAFtEAq1mUYFhE1+rp7UrM6vZ3ZA2RU4i1kCafhnCcU4ZE/MfBsbYj8
         6tqpP9mK6sP20ZIiV+DJIAnblSMPz/REg7PcRLl5jt66Vxi4N9WRCUYQ3Nhe2IxHTZW6
         0uL9aMpgR/7if/vrPT7obOODRWmjuzsQ3GOf2iNYq7rG/0m7f47O9hqocdfJVFPJFgie
         8KnEtemHtQp5YhmcrLQAktQXlDdldEm+JPvlTq+0d8sP3+Bd8/0ksYbWhOAR5dgx1Zpy
         yBdctgFQGH63A1Oo7vkl5k6U19H5ht2j0wM8f4eHft2+OchLgSow0ztB1boZQZH44WIE
         RabA==
X-Gm-Message-State: AC+VfDwEE0gWl+3S0U5Dz/CLw1BhWmbWjSnRVOV7l91Mb8pVpvewnfl2
        hdFZ5Sn1CsOwv+siMK1sj9WV5twhKSmYrbcgMXs=
X-Google-Smtp-Source: ACHHUZ62o8vjFFRydcKhHGi5+j0L1cme29GFNm0BJknSReyU2DZE4OU4i60BQDp0OSzCWS04dCl2cezriat6v5s72aY=
X-Received: by 2002:a05:6808:289:b0:38e:f305:3d40 with SMTP id
 z9-20020a056808028900b0038ef3053d40mr1492716oic.1.1682535987866; Wed, 26 Apr
 2023 12:06:27 -0700 (PDT)
MIME-Version: 1.0
From:   Cheryl Roger <bestviewdataprovider3@gmail.com>
Date:   Wed, 26 Apr 2023 14:06:16 -0500
Message-ID: <CA+QguCy8zs12dxZ9fMEFr4yYAqjk2B_=Ko3pH_EG5n5CQAePZw@mail.gmail.com>
Subject: RE: NTI Critical Care Exposition Attendees Email List- 2023
To:     Cheryl Roger <bestviewdataprovider3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FILL_THIS_FORM,
        FILL_THIS_FORM_LONG,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Would you be interested in acquiring AACN's National Teaching
Institute & Critical Care Exposition Attendees Data List-2023?

List Includes: Company Name, First Name, Last Name, Full Name, Contact
Job Title, Verified Email Address, Website URL, Mailing address, Phone
number, Industry and many more=E2=80=A6

Number of Contacts: 11,429
Cost: $ 1,526

Kind Regards,
Cheryl Roger
Marketing Coordinator
