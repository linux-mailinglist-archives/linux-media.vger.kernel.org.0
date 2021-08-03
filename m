Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD63B3DF5F0
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 21:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240302AbhHCTqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 15:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240300AbhHCTq1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Aug 2021 15:46:27 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1EAC06175F
        for <linux-media@vger.kernel.org>; Tue,  3 Aug 2021 12:46:15 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so237617pji.5
        for <linux-media@vger.kernel.org>; Tue, 03 Aug 2021 12:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3nOLous5BdC2Vwigd/sUxTARBcIKorC+Yem2YG2Kcf8=;
        b=ALpY5IpDWS2MrWYntcIGb9kIypcJpfYpKe/1l+O7Rh1J3Z8RoYbskNmDyWQF5z9zKZ
         hUahgFDcfylZ+MPgVFqc6eMt7hWs46rEdhFhWBHuzcy/Wk1nYPr4N8chNYNwKLByzOqa
         IxQdMMxBo6PyH5C5h2Tjct7UA1sfiXTvCBJi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3nOLous5BdC2Vwigd/sUxTARBcIKorC+Yem2YG2Kcf8=;
        b=QabD4LlM534vMegNcyVxd7GGZgSf5z9tWafRA/MSs4/2O2W1gGPxw8SMfGbC+I3Sgl
         DLS9hwfcqRWYKNJFGlrJIuC6j4tmO2VLzX66t9xpEQVIN4uSb7KCdDWIf1jM87IGTS7Q
         IS1/woI/v9fTr/l1AZ1ivHLsENlwOnQElZijhE8HNq6NjPtx4kQ0qeCLxgWfMj5dCSI5
         JUPLh9pmSN/zJnHvQ1Sp2stRLBcB1nh9fguOhizjWUWvOzN7b5h4y0+F0TIhlaJByCG/
         8Z6Mp80SuthSiLEH2lrsxu77D1uZP6Wv4WhKiWeR1HomXj7n0OzyyQIwggyWi2DQGJ5r
         vLNQ==
X-Gm-Message-State: AOAM533Zj6JfzjZunJogDFwgX8scDyAYGaM8Tr8uEVUYKbIl4xOgUmL9
        uFnbSTD1NA3DjmHpMbx0MsvQIg==
X-Google-Smtp-Source: ABdhPJzQM8n3oBv1SALPP2DogMCvLv3YaBFoOhEF9vQXfThEJaNepHkbMYB/9GSb/lPpS/siqyxbNQ==
X-Received: by 2002:a17:90a:fb85:: with SMTP id cp5mr25018189pjb.214.1628019975609;
        Tue, 03 Aug 2021 12:46:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x26sm899pfm.77.2021.08.03.12.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 12:46:13 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH 0/3] Avoid card name truncation
Date:   Tue,  3 Aug 2021 12:46:07 -0700
Message-Id: <20210803194610.326030-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=643; h=from:subject; bh=3ySFWN7x+E+djXwffG2kD4zxO+GbdUjCLq52ZOvMYts=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhCZ0BdgR/6zF0CascMWcvz0eErdrVyXoO4eBsApKl PohlUQuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQmdAQAKCRCJcvTf3G3AJmAGEA CJUXU17ndoMBDiOfv3kT6KOmZmv+5N5j0AzwjoTAuCSYV3KjeKsjmfCb1Q9iBnwNqf9brAIdkzLK0T 9r8VqM1hzXxCWvoEA1DswYtsdtIO27GiWPtpemkk8kzxwQsGLT0Sl5BS3dmrf8QogSONbLJmvtrZWh Awq1vhrGWHOkUDYbB7x5keiqhDxEPpVejxN/BZzbnbNnPf0oghUNyZp1G9j2IlSrBHUGuysLYAPwg6 WYAvNYk0OuVBQZYzNKjr3Dy+TzcRUtiJPGN/bcIa8e6J6dWBEN8vhGY5UOKI26Db+oU0ZJpk1Y2u/S kPMNNlYgQf0VZlpPmc2INwFWPglkL22vZium3sr89lt51B4zcKWZVxtSZxcZRW/UM0xtdtMX11KSkF NghOCXgg60MEC9UEN9CHsTel1aBozu98KbTM7GZB/2qFXFqMJvAWfhGrVjnndg2NLMkIYu58CZ1kbw BJY09ymG4R4xr4VNOXxEm/JwxEhlYNGSBzIRBNydMIKUBZaDvr5grB1NKCldTn0OBdaix3t3lHmQNl mm3fwlnIqdDhvkpaX8SCqYNWQumKlOOUTT5rErAx+kxZdhB9IWMH+oF4V9eHP1Kg7UMlFi1zRHcM0M BRrZOIiYbOKzYhtN3SiYHeJbMlBRRZscl0Eau+Oaxx6ciSlUk8dBb2aJdPwg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

While fixing some missing compile-time overflow warnings, I found a few
media devices that had their card description silently truncated. Fix
them using Hans's suggested text.

-Kees

Kees Cook (3):
  media: radio-wl1273: Avoid card name truncation
  media: si470x: Avoid card name truncation
  media: tm6000: Avoid card name truncation

 drivers/media/radio/radio-wl1273.c            | 2 +-
 drivers/media/radio/si470x/radio-si470x-i2c.c | 2 +-
 drivers/media/radio/si470x/radio-si470x-usb.c | 2 +-
 drivers/media/usb/tm6000/tm6000-video.c       | 3 +--
 4 files changed, 4 insertions(+), 5 deletions(-)

-- 
2.30.2

