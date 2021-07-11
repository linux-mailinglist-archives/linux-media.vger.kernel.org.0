Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E0B3C3F0F
	for <lists+linux-media@lfdr.de>; Sun, 11 Jul 2021 22:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhGKU0b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Jul 2021 16:26:31 -0400
Received: from mx.ucr.edu ([138.23.62.67]:57726 "EHLO mx5.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229817AbhGKU0b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Jul 2021 16:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1626035024; x=1657571024;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=knolZgBhatuIwg555Bgxz2YLsAZpb8GlB7yQJDayxi0=;
  b=U2HoASW6SUmQT3q/AqMe6tSMfIRR93zFDAgUL7YO2EOoAY5dUhQHOCGX
   ExEZX373kiYpASysMDAQ+s5QBCVUJcQY1pqKARsEqLkktLeSdn0dmofbB
   08eC7Hxx+jD64Yp2DR2ckkem+BSgLETx2EBANmCvdUAPOI0NZYqBq+GaO
   WbcdwiwFsG/pOQzTrfuW0SqKerXQSfiSRTFfU1MsalnDC9MwsuOssMEC5
   +2pQyoijgGFUqBV561EVj2foo56xPhf1PHfPlnfpZm5vixG5uMbCVWZ/i
   ETL8zNvo/kBVP7Oobmq/y49MRWbfuyz5iYD1B/cOyOSm3eNCC6JLwzLWk
   w==;
IronPort-SDR: dbH9lkB/BGR6LPFMbjo0UTwb20YjuO8oaD7N5wnkTKDFkKYi8V3JS2VNAmIDFcLIA0r7JgzoV+
 jZ4JUpGI/tx/b3FnPI1syi3LUtGKo/aR3aWbTymHLz78BtdGhV2mwpAGNQjYwBm13GnV6BX25i
 qY9mdBBxC/7EnLlLJ7Gva5pJ+a4gFuQ2PYsh1YgYfybxLkbhXejiAFS+e+jBAxiSdu0HEjkzoI
 rNJtiQDgSZKHB3nfKyYirkzM25XbOrBlepB/HbrVrwFMzNZ2NpGgluU1VtDuOIpnySFmxkxISk
 Grc=
X-IPAS-Result: =?us-ascii?q?A2EhBwAJUutgf0jYVdFaHgEBCxIMgg4Lg3lVFo1Mhw0BA?=
 =?us-ascii?q?QEGjCIYgQGGeohmgXwCCQEBAQ0BAT8CBAEBhFSCewIlNAkOAgQBAQEBAwIDA?=
 =?us-ascii?q?QEBAQUBAQYBAQEBAQEFBAEBAhABAW6FL0aCOCmDZQsWIAFGgRUBBQE1IjmCF?=
 =?us-ascii?q?gGCYSYFnDiBBD2MZIEBiCcBCQ2BYwkBCIEoiHuFF4EZgRCCUIEzdYdvglAEg?=
 =?us-ascii?q?xd7E4N5AQEBk0+LOJ0FAQYCgwocgw6bDEWGYI5ZkRgBLbY4hB0CBAEBAQMHB?=
 =?us-ascii?q?hAjgTiCFU0lgWwKgUFQGQ6dDSEyOAIGCgEBAwlbiyMB?=
IronPort-PHdr: A9a23:x+VHlREvfc1DPWWrbfjry51Gf/VMhN3EVzX9CrIZgr5DOp6u447ld
 BSGo6k31BmQBc6FuroE07OQ7/mxHzRYoN6oizMrSNR0TRgLiMEbzUQLIfWuLgnFFsPsdDEwB
 89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ/iOgVrO+/7BpDdj9it1+C15pbffxhEiCCybL9sM
 Bm6txjdutUZjYZjLqs61x/FrmdVd+hMym5kOFaekwzg6sus+ZJo7jhdte8m+8NcS6vxYr42T
 aZfDDQoMmA14NPkuBzeRgaR5XUST3sbnANQDwfK8B/1UJHxsjDntuVmwymVIdf2TbEvVju86
 apgVQLlhz0GNz4992HXl9BwgadGqx+vuxBz34jZa5yOOfFgYq3SY88VRWtZXsZQSSNBBJ+8b
 5ASBOYFJOpUspXxq0cLoRa4AAmsBfjvyiRJhn/w0q0xzvovHxjb1wwuHtIBrnDUo8joP6sWX
 +250KzEwDPEYP5K1zrx9JXEfgk9rf2RQLl8ddfdxEkqGw7Dk16eq5HqPymN2+oNrWaV8uRuW
 +GohWEopA98uSSjy8Q2h4XVnI8Z1kzI+CNky4g1P924T0t7bMamH5tRtiCaN5Z2QsQ/SGxvu
 Cc7y70GtoS6fCQW1JgqyQXSa+GbfIiS+B7sSvueISphiX9jZbmwiAq8/1K6xe3gSsm7zkxKr
 ixdn9TCsn0AygHe5MiZR/Vz4EusxTiC2gDO5+xGLk45iLTXJZA8z7MymZQetUrOEjP1lUj2k
 aObalgp9/Wq5unjbLjroIKXOYxsigzmLKgihsiyDf47PwUORWSX5/mw2bz58UD7XrlGluA6n
 6jdvZzAO8gWqK60DxVL3osi8RqyDiuq3dIFlncdNl1FYgiIj43xNlHLJ/D3EOmwjky3kDdu2
 /DGJrrhAojRLnTbkLfuY7J960lExQo2199f5pZUBqgZIPLxR0P9rdLYAx0nPwCuzObnD9J91
 owaWW2RGKOWLKTSsVqQ6uIuJemDepMVtS7jJ/Q54/Pil3w0lF8HcaW3wJcaaWq0E/Z4L0mBZ
 HrjmNYBEWMEvgokS+zqjUWPUD5SZnayRa085y03BJ6oAIrYW4CinKaB0D2lEZJLe2BKEkqMH
 mvwd4WYR/cMbzqfIstgkjwCSLigRJYt1RSwuwDnyrpoNPHZ+jMXtZ39zth5/e7Tmg8o9TxyE
 cud13uBT2ZunmMHFHcYxqd69H182Fee1uAsku5YHN0Lv6hhTwwgc5PQ0ropWJjJRgvdc4LRG
 x6dSdK8DGR0E49Z/g==
IronPort-HdrOrdr: A9a23:aekesqyBdFkDg9KbwbL8KrPwEb1zdoMgy1knxilNoNJuA6mlfq
 eV7Y8mPHDP+VEssR0b6LO90cq7MAvhHOBOkO8s1N6ZNWGM2FdARLsC0WKI+UyFJ8SRzJ8+6U
 6iScVD4R/LZ2SSQfyU3ODBKadY/DBPyszHudvj
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; 
   d="scan'208";a="225252742"
Received: from mail-pj1-f72.google.com ([209.85.216.72])
  by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jul 2021 13:23:43 -0700
Received: by mail-pj1-f72.google.com with SMTP id x1-20020a17090ab001b02901726198443cso12853458pjq.8
        for <linux-media@vger.kernel.org>; Sun, 11 Jul 2021 13:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aSJsemQuEJggnAB9yPIA6lDwcxwNnBl6SI50zavXFPE=;
        b=PVEvEm0g/bCkXAxaJnmxs1aQK+hKrsXdvN5XbYGbTX/AJx6JU6C27zIonDKyEjZ0O4
         CjcO9Ouf5jBBskXRqxkeTwWjnDgeFg5nENGMFVqu9t8d9F8vi27RFawox0XqpjOmL3ps
         g0hfv19mPqqcwB02ABWymKgswo8ndt6yEISJG2piU6vsg+9YRAEofsfKyJpjb9xmOXZu
         EPr/hFZFNU/NIKujh7UA3nn0LFOl5FO/uNtDtA6Aeb4ublE0kiu0kpL0uSnsvKx3KdoK
         0R9Tmjh/UVYrgRivuIo7EvZTF6z9jn06lY68/UHdmpdxGk/Gwo2zwAHVmBzuiRDyhqD4
         GqBQ==
X-Gm-Message-State: AOAM533gPgbk6/O/p23v8B3sGkFNRlPCMUmCMln5icLZZX4bquTT5lnR
        yJPzBWexv0OcSLSN6kxdw8/s4+qcmUSn3NBjoJpTnqOOmPanfbv7AtFNwbxKMecq+nML8MXksCT
        uk7HC7yHEbQZleQVxktNN2UiS
X-Received: by 2002:a17:902:9b87:b029:11e:7c15:a597 with SMTP id y7-20020a1709029b87b029011e7c15a597mr40411342plp.6.1626035022792;
        Sun, 11 Jul 2021 13:23:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxluD4OhWJyegly9NdVTbZoCzN/+hubXRoiMZtpc8eeGRXGkRv8qro8QAoIpFG6fP3ZnpWpww==
X-Received: by 2002:a17:902:9b87:b029:11e:7c15:a597 with SMTP id y7-20020a1709029b87b029011e7c15a597mr40411331plp.6.1626035022598;
        Sun, 11 Jul 2021 13:23:42 -0700 (PDT)
Received: from protoss.cs.ucr.edu (protoss.cs.ucr.edu. [169.235.26.60])
        by smtp.gmail.com with ESMTPSA id b33sm14628997pgb.92.2021.07.11.13.23.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Jul 2021 13:23:42 -0700 (PDT)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     Yizhuo <yzhai003@ucr.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging: atomisp: fix the uninitialized use in gc2235_detect()
Date:   Sun, 11 Jul 2021 13:23:32 -0700
Message-Id: <20210711202334.27959-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Inside function gc2235_detect(), variable "low" could be uninitialized
if ov5693_read_reg() returns error, however, it affects the value of
variable "id". The "id" is used in the later if statement, which is
potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
index e698b63d6cb7..a899e806dfcd 100644
--- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
+++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
@@ -1714,6 +1714,8 @@ static int ov5693_detect(struct i2c_client *client)
 	}
 	ret = ov5693_read_reg(client, OV5693_8BIT,
 			      OV5693_SC_CMMN_CHIP_ID_L, &low);
+	if (ret)
+		return ret;
 	id = ((((u16)high) << 8) | (u16)low);
 
 	if (id != OV5693_ID) {
-- 
2.32.0

