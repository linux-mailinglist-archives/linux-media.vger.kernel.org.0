Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1826136EBF9
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 16:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239774AbhD2OHI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 10:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239646AbhD2OHE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 10:07:04 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C65C06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 07:06:17 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id y30so2056855pgl.7
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 07:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=MK1JNYymHNZjAuSw7w569yYJuYIhIGNffTSHi9WTjH0=;
        b=cLQY0MZXd1QKEfU0faEULRDEWzctexT/MNF6ksABMzPMwyirUi2R0YYkah2/fGJ92x
         0V/MMILqgseZcLxuqrtDBt+UJQ0VifmW90U8QFBDZaxejIgjoQqJ7UzH/bRT5AMovCuI
         nZq0Pf4UNAnoagFHyU8MzlCCEM71lEuHcy+Jse6HnnbUaGgijd43KPpTC6+yEvZNvjw1
         nKXVErJ3SBsjp2fMOP7qDWLcHMDJ0T7hiWeG4hgO9gefD0erX3lTTgLZwYY/liJQBdEQ
         3jLoeVcReK6CaJZG7lmZDvzDzWctegdH1CusJQRtJuJB2ijSU8zWcDe8loYRIvVwc44X
         L9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=MK1JNYymHNZjAuSw7w569yYJuYIhIGNffTSHi9WTjH0=;
        b=FnkaJRDCEoAv5JYtrJZMbGWnb2wN7XApTPCIOoHjF8sHWJm3H8uoCIlKrUTGEVXkSg
         ACW7h+BD9XDjMmbnf0MxCvbfrjGJr1Z5ZGMgFfMqVZQJa24tE4h7WBK63+fApWNNKrV+
         OnrHLJo3Hgnm/qkKPPBrCTYULDD14Xo0kLvi96P0fd4KSbF2fxHSbJfsbugsxp92eHk8
         g90O/rrcpbWn2YkM7ZquRnz+/pEQ+G0wdOQFOMi3eoFOwWGGe/cj0P0dVIVlak21hhW4
         i9ftsMv49Xh383a0TsN2Av5ILqkj9BQ62gLeKp7o4yr9oWtXDb579fNX3FAEl7dYZueV
         IDfg==
X-Gm-Message-State: AOAM533kp9Esyg8Q5xQxfR0LdMMOZJBnGJIGdOh4MMYzF4f1JalrvqDE
        Efr7gyeshyP57JU9el+BbBRpO9U5AGspM0Wv35E=
X-Google-Smtp-Source: ABdhPJwPUw82+20jm7/4d86OMxIe67wTj+tQT2TshOJWEvzsrgJWhGBy4rVSoVihMoi65UK5v75bjGOX/Fhglor7VYw=
X-Received: by 2002:a62:2cce:0:b029:21d:97da:833e with SMTP id
 s197-20020a622cce0000b029021d97da833emr32777454pfs.40.1619705176781; Thu, 29
 Apr 2021 07:06:16 -0700 (PDT)
MIME-Version: 1.0
Sender: rachellehounssavi@gmail.com
Received: by 2002:a05:6a10:474f:0:0:0:0 with HTTP; Thu, 29 Apr 2021 07:06:16
 -0700 (PDT)
From:   kayla manthey <sgtmanthey1@gmail.com>
Date:   Thu, 29 Apr 2021 14:06:16 +0000
X-Google-Sender-Auth: MW_BRqXGsl3eXbCsn3KKDuFMvMQ
Message-ID: <CAE0ZqBZdUXaE0ukwM_BBW8vTOSxckfKc1K9GE=8iXEBbsdKEtA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

K=C3=A9rem, szeretn=C3=A9m tudni, hogy megkapta-e az el=C5=91z=C5=91 =C3=BC=
zeneteimet.
