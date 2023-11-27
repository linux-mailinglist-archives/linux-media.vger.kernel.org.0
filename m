Return-Path: <linux-media+bounces-1059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6E87F96F7
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 01:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80AB0280DE1
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 00:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D3AA4C;
	Mon, 27 Nov 2023 00:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FA8119;
	Sun, 26 Nov 2023 16:58:37 -0800 (PST)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0Vx7PgGb_1701046714;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vx7PgGb_1701046714)
          by smtp.aliyun-inc.com;
          Mon, 27 Nov 2023 08:58:35 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: matthias.bgg@gmail.com,
	mchehab@kernel.org,
	yunfei.dong@mediatek.com,
	andrew-ct.chen@mediatek.com,
	tiffany.lin@mediatek.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] media: mediatek: vcodec: Remove unneeded semicolon
Date: Mon, 27 Nov 2023 08:58:33 +0800
Message-Id: <20231127005833.105870-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c:569:2-3: Unneeded semicolon
./drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c:583:2-3: Unneeded semicolon
./drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c:599:2-3: Unneeded semicolon
./drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c:613:2-3: Unneeded semicolon
./drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c:633:2-3: Unneeded semicolon
./drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c:647:2-3: Unneeded semicolon
./drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c:683:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7632
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index d54b3833790d..b903e39fee89 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -566,7 +566,7 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
 	default:
 		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
 		break;
-	};
+	}
 }
 
 static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
@@ -580,7 +580,7 @@ static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
 	default:
 		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
 		break;
-	};
+	}
 }
 
 static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
@@ -596,7 +596,7 @@ static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
 	default:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
 		break;
-	};
+	}
 }
 
 static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
@@ -610,7 +610,7 @@ static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
 	default:
 		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
 		break;
-	};
+	}
 }
 
 static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
@@ -630,7 +630,7 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
 	default:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0;
 		break;
-	};
+	}
 }
 
 static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
@@ -644,7 +644,7 @@ static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
 	default:
 		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_1;
 		break;
-	};
+	}
 }
 
 static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
@@ -680,7 +680,7 @@ static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
 		break;
 	default:
 		break;
-	};
+	}
 }
 
 static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_dec_ctx *ctx)
-- 
2.20.1.7.g153144c


