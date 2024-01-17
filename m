Return-Path: <linux-media+bounces-3816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C545F830906
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 16:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBF711C219C6
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 15:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E2921103;
	Wed, 17 Jan 2024 15:02:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BCF20DC9
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 15:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503768; cv=none; b=fa7xaqqMp2nHCmGcNGlHtlEQTYXWYZjA3uqCuROTaRCOnOEw0Ga7e9+s2BAOD5I+tqUPBGzCMT4Wg1u1b50KP0BeHcWi0fGpP2CbF/HLvnktqnFkkz2r73N00dx7cRh1L2Oi7cryghGGe9QIPJY1Tb7vCT7lKhPe6iRZO615G2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503768; c=relaxed/simple;
	bh=hCSRH7GnB+hscoIRa+FXLwC/so9P59FpBRKWjEq6CGY=;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding; b=pC8Ywjooimp/maERVM7cW3bmLzNXLDnbm0TmEFHT9hLdCJ83Zk/CGNSnshBkCYFFJc77NIvCF34yrwXLYB6zZdQDzt8chWZasJt9+z9NXWYP7g7HTTF0O475SasPV5XI6lf7fjkQ75H4BRBHtPCFvBWAljBMfChnZIJahLXFic0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00115C43394;
	Wed, 17 Jan 2024 15:02:46 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 07/10] v4l2-compliance: add support for v4l-audioX devices
Date: Wed, 17 Jan 2024 16:02:15 +0100
Message-ID: <c417ab9e922db2e2c1fc4a8375820b544d9b1a4b.1705503477.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
References: <79cf7f3c0fdde2ff151ba05d912ba05b35386d4a.1705503477.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support compliance testing of v4l-audioX devices.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/v4l2-compliance/v4l2-compliance.1.in  |  7 ++++++
 utils/v4l2-compliance/v4l2-compliance.cpp   | 16 +++++++++---
 utils/v4l2-compliance/v4l2-compliance.h     |  3 ++-
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 10 +++++---
 utils/v4l2-compliance/v4l2-test-formats.cpp | 28 +++++++++++++++++++++
 utils/v4l2-compliance/v4l2-test-media.cpp   |  1 +
 6 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-compliance.1.in b/utils/v4l2-compliance/v4l2-compliance.1.in
index fa12ae2d..5113696f 100644
--- a/utils/v4l2-compliance/v4l2-compliance.1.in
+++ b/utils/v4l2-compliance/v4l2-compliance.1.in
@@ -81,6 +81,13 @@ Otherwise if \fB-z\fR was specified earlier, then \fI<dev>\fR is the entity name
 or interface ID (if prefixed with 0x) as found in the topology of the media device
 with the bus info string as specified by the \fB-z\fR option.
 .TP
+\fB\-A\fR, \fB\-\-audio\-device\fR \fI<dev>\fR
+Use device \fI<dev>\fR as the audio memory-2-memory device. If \fI<dev>\fR is a number,
+then /dev/v4l-audio\fI<dev>\fR is used.
+Otherwise if \fB-z\fR was specified earlier, then \fI<dev>\fR is the entity name
+or interface ID (if prefixed with 0x) as found in the topology of the media device
+with the bus info string as specified by the \fB-z\fR option.
+.TP
 \fB\-u\fR, \fB\-\-subdev\-device\fR \fI<dev>\fR
 Use device \fI<dev>\fR as the v4l-subdevX device. If \fI<dev>\fR is a number, then /dev/v4l-subdev\fI<dev>\fR is used.
 Otherwise if \fB-z\fR was specified earlier, then \fI<dev>\fR is the entity name
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 9e2c6983..bea7eb4f 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -43,6 +43,7 @@
    case is used to retrieve a setting. */
 enum Option {
 	OptStreamAllIO = 'a',
+	OptSetAudioDevice = 'A',
 	OptStreamAllColorTest = 'c',
 	OptColor = 'C',
 	OptSetDevice = 'd',
@@ -124,6 +125,7 @@ static struct option long_options[] = {
 	{"subdev-device", required_argument, nullptr, OptSetSubDevDevice},
 	{"expbuf-device", required_argument, nullptr, OptSetExpBufDevice},
 	{"touch-device", required_argument, nullptr, OptSetTouchDevice},
+	{"audio-device", required_argument, nullptr, OptSetAudioDevice},
 	{"media-device", required_argument, nullptr, OptSetMediaDevice},
 	{"media-device-only", required_argument, nullptr, OptSetMediaDeviceOnly},
 	{"media-bus-info", required_argument, nullptr, OptMediaBusInfo},
@@ -198,6 +200,10 @@ static void usage()
 	printf("                     Use device <dev> as the touch device.\n");
 	printf("                     If <dev> starts with a digit, then /dev/v4l-touch<dev> is used.\n");
 	printf("                     See the -d description of how <dev> is used in combination with -z.\n");
+	printf("  -A, --audio-device <dev>\n");
+	printf("                     Use device <dev> as the audio M2M device.\n");
+	printf("                     If <dev> starts with a digit, then /dev/v4l-audio<dev> is used.\n");
+	printf("                     See the -d description of how <dev> is used in combination with -z.\n");
 	printf("  -u, --subdev-device <dev>\n");
 	printf("                     Use device <dev> as the v4l-subdev device.\n");
 	printf("                     If <dev> starts with a digit, then /dev/v4l-subdev<dev> is used.\n");
@@ -639,7 +645,7 @@ static int testCap(struct node *node)
 			V4L2_CAP_SDR_OUTPUT | V4L2_CAP_SLICED_VBI_OUTPUT |
 			V4L2_CAP_MODULATOR | V4L2_CAP_META_OUTPUT;
 	const __u32 overlay_caps = V4L2_CAP_VIDEO_OVERLAY | V4L2_CAP_VIDEO_OUTPUT_OVERLAY;
-	const __u32 m2m_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE;
+	const __u32 m2m_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_AUDIO_M2M;
 	const __u32 io_caps = V4L2_CAP_STREAMING | V4L2_CAP_READWRITE;
 	const __u32 mplane_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_VIDEO_OUTPUT_MPLANE |
 		V4L2_CAP_VIDEO_M2M_MPLANE;
@@ -983,6 +989,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 	node.is_radio = type == MEDIA_TYPE_RADIO;
 	node.is_sdr = type == MEDIA_TYPE_SDR;
 	node.is_touch = type == MEDIA_TYPE_TOUCH;
+	node.is_audio = type == MEDIA_TYPE_AUDIO;
 
 	if (node.is_v4l2()) {
 		doioctl(&node, VIDIOC_QUERYCAP, &vcap);
@@ -1038,13 +1045,13 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 			 V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_VIDEO_M2M_MPLANE |
 			 V4L2_CAP_VIDEO_M2M | V4L2_CAP_SLICED_VBI_CAPTURE |
 			 V4L2_CAP_RDS_CAPTURE | V4L2_CAP_SDR_CAPTURE |
-			 V4L2_CAP_META_CAPTURE))
+			 V4L2_CAP_META_CAPTURE | V4L2_CAP_AUDIO_M2M))
 		node.can_capture = true;
 	if (node.g_caps() & (V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VBI_OUTPUT |
 			 V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_VIDEO_M2M_MPLANE |
 			 V4L2_CAP_VIDEO_M2M | V4L2_CAP_SLICED_VBI_OUTPUT |
 			 V4L2_CAP_RDS_OUTPUT | V4L2_CAP_SDR_OUTPUT |
-			 V4L2_CAP_META_OUTPUT))
+			 V4L2_CAP_META_OUTPUT | V4L2_CAP_AUDIO_M2M))
 		node.can_output = true;
 	if (node.g_caps() & (V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_VIDEO_OUTPUT_MPLANE |
 			 V4L2_CAP_VIDEO_M2M_MPLANE))
@@ -1706,6 +1713,9 @@ int main(int argc, char **argv)
 		case OptSetTouchDevice:
 			device = make_devname(optarg, "v4l-touch", media_bus_info);
 			break;
+		case OptSetAudioDevice:
+			device = make_devname(optarg, "v4l-audio", media_bus_info);
+			break;
 		case OptSetSubDevDevice:
 			device = make_devname(optarg, "v4l-subdev", media_bus_info);
 			break;
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 0cfc9a37..6fc84cf1 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -102,7 +102,7 @@ using frmsizes_count_map = std::map<__u32, unsigned>;
 
 struct base_node;
 
-#define V4L2_BUF_TYPE_LAST V4L2_BUF_TYPE_META_OUTPUT
+#define V4L2_BUF_TYPE_LAST V4L2_BUF_TYPE_AUDIO_OUTPUT
 
 struct base_node {
 	bool is_video;
@@ -111,6 +111,7 @@ struct base_node {
 	bool is_sdr;
 	bool is_meta;
 	bool is_touch;
+	bool is_audio;
 	bool is_m2m;
 	bool is_io_mc;
 	bool is_planar;
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 922b99b5..d5dc2625 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -235,12 +235,14 @@ public:
 		if (v4l_type_is_output(g_type()))
 			fill_output_buf(fill_bytesused);
 		err = node->qbuf(*this);
-		if (err == 0 &&
-		    v4l_type_is_video(g_type()) && v4l_type_is_output(g_type())) {
-			fail_on_test(g_field() == V4L2_FIELD_ANY);
+		if (err)
+			return err;
+		if (v4l_type_is_output(g_type())) {
+			if (v4l_type_is_video(g_type()))
+				fail_on_test(g_field() == V4L2_FIELD_ANY);
 			buffer_info[g_timestamp()] = buf;
 		}
-		return err;
+		return 0;
 	}
 	int qbuf(node *node, const cv4l_queue &q)
 	{
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index 8a16613c..adec678a 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -43,6 +43,8 @@ static constexpr __u32 buftype2cap[] = {
 	V4L2_CAP_SDR_OUTPUT,
 	V4L2_CAP_META_CAPTURE,
 	V4L2_CAP_META_OUTPUT,
+	V4L2_CAP_AUDIO_M2M,
+	V4L2_CAP_AUDIO_M2M,
 };
 
 static int testEnumFrameIntervals(struct node *node, __u32 pixfmt,
@@ -330,6 +332,8 @@ int testEnumFormats(struct node *node)
 		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		case V4L2_BUF_TYPE_SDR_CAPTURE:
 		case V4L2_BUF_TYPE_SDR_OUTPUT:
+		case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		case V4L2_BUF_TYPE_AUDIO_OUTPUT:
 			if (ret && (node->g_caps() & buftype2cap[type]))
 				return fail("%s cap set, but no %s formats defined\n",
 						buftype2s(type).c_str(), buftype2s(type).c_str());
@@ -447,6 +451,7 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
 	struct v4l2_sliced_vbi_format &sliced = fmt.fmt.sliced;
 	struct v4l2_sdr_format &sdr = fmt.fmt.sdr;
 	struct v4l2_meta_format &meta = fmt.fmt.meta;
+	struct v4l2_audio_format &audio = fmt.fmt.audio;
 	unsigned min_data_samples;
 	unsigned min_sampling_rate;
 	v4l2_std_id std;
@@ -591,6 +596,13 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
 					meta.dataformat, fcc2s(meta.dataformat).c_str(), type);
 		fail_on_test(meta.buffersize == 0);
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		if (map.find(audio.audioformat) == map.end())
+			return fail("audioformat %08x (%s) for buftype %d not reported by ENUM_FMT\n",
+					audio.audioformat, fcc2s(audio.audioformat).c_str(), type);
+		fail_on_test(audio.buffersize == 0);
+		break;
 	case V4L2_BUF_TYPE_PRIVATE:
 		break;
 	}
@@ -626,6 +638,8 @@ int testGetFormats(struct node *node)
 		case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		case V4L2_BUF_TYPE_SDR_CAPTURE:
 		case V4L2_BUF_TYPE_SDR_OUTPUT:
+		case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+		case V4L2_BUF_TYPE_AUDIO_OUTPUT:
 			if (ret && (node->g_caps() & buftype2cap[type]))
 				return fail("%s cap set, but no %s formats defined\n",
 					buftype2s(type).c_str(), buftype2s(type).c_str());
@@ -703,6 +717,9 @@ static bool matchFormats(const struct v4l2_format &f1, const struct v4l2_format
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return !memcmp(&f1.fmt.meta, &f2.fmt.meta, sizeof(f1.fmt.meta));
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return !memcmp(&f1.fmt.audio, &f2.fmt.audio, sizeof(f1.fmt.audio));
 
 	}
 	return false;
@@ -782,6 +799,10 @@ int testTryFormats(struct node *node)
 			case V4L2_BUF_TYPE_META_OUTPUT:
 				pixelformat = fmt.fmt.meta.dataformat;
 				break;
+			case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+			case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+				pixelformat = fmt.fmt.audio.audioformat;
+				break;
 			case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 			case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 				pixelformat = fmt.fmt.pix_mp.pixelformat;
@@ -860,6 +881,9 @@ static int testM2MFormats(struct node *node)
 	fail_on_test(node->g_fmt(fmt_out, out_type));
 	fail_on_test(node->g_fmt(fmt_cap, cap_type));
 
+	if (node->has_audio_m2m())
+		return 0;
+
 	/*
 	 * JPEG codec have fixed colorspace, so these tests
 	 * are different compared to other m2m devices.
@@ -1132,6 +1156,10 @@ int testSetFormats(struct node *node)
 			case V4L2_BUF_TYPE_META_OUTPUT:
 				pixelformat = fmt_set.fmt.meta.dataformat;
 				break;
+			case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+			case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+				pixelformat = fmt_set.fmt.audio.audioformat;
+				break;
 			case V4L2_BUF_TYPE_SDR_CAPTURE:
 			case V4L2_BUF_TYPE_SDR_OUTPUT:
 				pixelformat = fmt_set.fmt.sdr.pixelformat;
diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
index 52ab7fb8..ee1d03e0 100644
--- a/utils/v4l2-compliance/v4l2-test-media.cpp
+++ b/utils/v4l2-compliance/v4l2-test-media.cpp
@@ -573,6 +573,7 @@ void walkTopology(struct node &node, struct node &expbuf_node,
 		case MEDIA_TYPE_RADIO:
 		case MEDIA_TYPE_SDR:
 		case MEDIA_TYPE_TOUCH:
+		case MEDIA_TYPE_AUDIO:
 		case MEDIA_TYPE_SUBDEV:
 			break;
 		default:
-- 
2.42.0


