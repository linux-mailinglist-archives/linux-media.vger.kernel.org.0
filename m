Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC2A69504B
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 20:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjBMTFS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 14:05:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjBMTFL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 14:05:11 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF6CA93F2
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 11:04:57 -0800 (PST)
Received: from [IPv6:2804:14d:72b4:8284:32a8:8167:f815:2895] (unknown [IPv6:2804:14d:72b4:8284:32a8:8167:f815:2895])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dwlsalmeida)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EF412660214A;
        Mon, 13 Feb 2023 19:04:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676315096;
        bh=j671qOkDzEye502sUZ5kcV5uGH1p00rM+Sqdd0OHM94=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=ZqWcMEJqHebc3rVjevdoXg201FdvEuM67oLfI7OYP/t/spcrU9+hNcUDBgRMff+bk
         pOY1mRSBibGNrbIhj5nKnBUxo0wEDY5YAlBZBchF12qrI2KjEjIp76dqDOpYD6V0FG
         NVi1X1Hx4fGcUJykHzF1usYZV7CZnMpVz99QN3IY8d5K3O+uZO0P57D4M6TbME4ERQ
         +WyQgdZNfUdSHCoU27k5HY7icOnaiRlZ90J47GcVXI5C+ZzXt6DOuvuTFv3lqobs5W
         +++cqla0uEqgbm0eWZiMn31rD4UNrVnYA977/tFMpyOKqh5pGvvX2WIXBWcoqV0i2T
         rt3OyjeGLM9eg==
Message-ID: <7b2276aab6d01bda092ff6f7f2beeaa4d0d70e3d.camel@collabora.com>
Subject: Re: [PATCH v5] media: Add AV1 uAPI
From:   Daniel Almeida <daniel.almeida@collabora.com>
To:     hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Date:   Mon, 13 Feb 2023 16:04:42 -0300
In-Reply-To: <20230213154436.193658-1-daniel.almeida@collabora.com>
References: <20230213154436.193658-1-daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, one thing to note though:

Neither me nor Benjamin managed to reproduce this:

```

include/uapi/linux/v4l2-controls.h:819: error: Cannot parse enum!
include/uapi/linux/v4l2-controls.h:855: error: Cannot parse enum!
include/uapi/linux/v4l2-controls.h:3080: warning: Enum value
'V4L2_AV1_SEG_LVL_REF_SKIP' not described in enum
'v4l2_av1_segment_feature'
include/uapi/linux/v4l2-controls.h:3080: warning: Enum value
'V4L2_AV1_SEG_LVL_REF_GLOBALMV' not described in enum
'v4l2_av1_segment_feature'
include/uapi/linux/v4l2-controls.h:3080: warning: Excess enum value
'V4L2_AV1_SEG_LVL_GLOBALMV' description in 'v4l2_av1_segment_feature'
include/uapi/linux/v4l2-controls.h:3080: warning: Excess enum value
'V4L2_AV1_SEG_LVL_SKIP' description in 'v4l2_av1_segment_feature'
include/uapi/linux/v4l2-controls.h:3365: warning: Function parameter or
member 'buffer_removal_time' not described in 'v4l2_ctrl_av1_frame'
include/uapi/linux/v4l2-controls.h:3377: warning: bad line:  =20
Specification.
include/uapi/linux/v4l2-controls.h:3438: error: Cannot parse struct or
union!
```

Was that simply "make htmldocs"?
