Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF22C9AF3
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 11:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729086AbfJCJqX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 3 Oct 2019 05:46:23 -0400
Received: from www.linuxtv.org ([130.149.80.248]:48363 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728812AbfJCJqX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 05:46:23 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iFxgd-0004Bj-Gf; Thu, 03 Oct 2019 09:46:15 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1iFxgz-0002By-LA; Thu, 03 Oct 2019 09:46:37 +0000
Date:   Thu, 3 Oct 2019 09:46:37 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <313765717.1.1570095997647.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <1358528102.0.1570089696546.JavaMail.jenkins@builder.linuxtv.org>
References: <1358528102.0.1570089696546.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: v4l-utils #51
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: v4l-utils
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/v4l-utils/51/display/redirect?page=changes>

Changes:

[hverkuil-cisco] libcecutil: do not assume building in source tree.


------------------------------------------
[...truncated 18.06 KB...]
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/ir-ctl'>
Making all in cx18-ctl
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/cx18-ctl'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/cx18-ctl'>
Making all in keytable
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/keytable'>
Making all in bpf_protocols
make[4]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/keytable/bpf_protocols'>
make[4]: Nothing to be done for 'all'.
make[4]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/keytable/bpf_protocols'>
make[4]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/keytable'>
make[4]: Nothing to be done for 'all-am'.
make[4]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/keytable'>
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/keytable'>
Making all in media-ctl
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/media-ctl'>
make  all-am
make[4]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/media-ctl'>
make[4]: Nothing to be done for 'all-am'.
make[4]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/media-ctl'>
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/media-ctl'>
Making all in v4l2-ctl
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-ctl'>
make  all-am
make[4]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-ctl'>
make[4]: Nothing to be done for 'all-am'.
make[4]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-ctl'>
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-ctl'>
Making all in v4l2-dbg
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-dbg'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-dbg'>
Making all in v4l2-sysfs-path
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-sysfs-path'>
make[3]: Nothing to be done for 'all'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/v4l2-sysfs-path'>
Making all in libcecutil
make[3]: Entering directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/libcecutil'>
  CXX      libcecutil_la-cec-info.lo
  CXX      libcecutil_la-cec-log.lo
  CXX      libcecutil_la-cec-parse.lo
cec-log.cpp: In function ‘const cec_msg_args* cec_log_msg_args(unsigned int)’:
cec-log.cpp:106:22: error: ‘messages’ was not declared in this scope
  if (index >= sizeof(messages) / sizeof(messages[0]))
                      ^~~~~~~~
cec-log.cpp:106:22: note: suggested alternative:
In file included from /usr/include/c++/8/string:43,
                 from cec-log.cpp:12:
/usr/include/c++/8/bits/localefwd.h:198:11: note:   ‘std::__cxx11::messages’
     class messages;
           ^~~~~~~~
cec-log.cpp:108:10: error: ‘messages’ was not declared in this scope
  return &messages[index];
          ^~~~~~~~
cec-log.cpp:108:10: note: suggested alternative:
In file included from /usr/include/c++/8/string:43,
                 from cec-log.cpp:12:
/usr/include/c++/8/bits/localefwd.h:198:11: note:   ‘std::__cxx11::messages’
     class messages;
           ^~~~~~~~
cec-log.cpp: In function ‘void log_digital(const char*, const cec_op_digital_service_id*)’:
cec-log.cpp:113:11: error: ‘arg_service_id_method’ was not declared in this scope
  log_arg(&arg_service_id_method, "service-id-method", digital->service_id_method);
           ^~~~~~~~~~~~~~~~~~~~~
cec-log.cpp:114:11: error: ‘arg_dig_bcast_system’ was not declared in this scope
  log_arg(&arg_dig_bcast_system, "dig-bcast-system", digital->dig_bcast_system);
           ^~~~~~~~~~~~~~~~~~~~
cec-log.cpp:116:12: error: ‘arg_channel_number_fmt’ was not declared in this scope
   log_arg(&arg_channel_number_fmt, "channel-number-fmt", digital->channel.channel_number_fmt);
            ^~~~~~~~~~~~~~~~~~~~~~
cec-log.cpp: In function ‘void log_rec_src(const char*, const cec_op_record_src*)’:
cec-log.cpp:149:12: error: ‘arg_ana_bcast_type’ was not declared in this scope
   log_arg(&arg_ana_bcast_type, "ana-bcast-type", rec_src->analog.ana_bcast_type);
            ^~~~~~~~~~~~~~~~~~
cec-log.cpp:149:12: note: suggested alternative: ‘arg_rec_src_type’
   log_arg(&arg_ana_bcast_type, "ana-bcast-type", rec_src->analog.ana_bcast_type);
            ^~~~~~~~~~~~~~~~~~
            arg_rec_src_type
cec-log.cpp:151:12: error: ‘arg_bcast_system’ was not declared in this scope
   log_arg(&arg_bcast_system, "bcast-system", rec_src->analog.bcast_system);
            ^~~~~~~~~~~~~~~~
cec-log.cpp: In function ‘void log_tuner_dev_info(const char*, const cec_op_tuner_device_info*)’:
cec-log.cpp:164:11: error: ‘arg_rec_flag’ was not declared in this scope
  log_arg(&arg_rec_flag, "rec-flag", tuner_dev_info->rec_flag);
           ^~~~~~~~~~~~
cec-log.cpp:164:11: note: suggested alternative: ‘log_rec_src’
  log_arg(&arg_rec_flag, "rec-flag", tuner_dev_info->rec_flag);
           ^~~~~~~~~~~~
           log_rec_src
cec-log.cpp:165:11: error: ‘arg_tuner_display_info’ was not declared in this scope
  log_arg(&arg_tuner_display_info, "tuner-display-info", tuner_dev_info->tuner_display_info);
           ^~~~~~~~~~~~~~~~~~~~~~
cec-log.cpp:165:11: note: suggested alternative: ‘log_tuner_dev_info’
  log_arg(&arg_tuner_display_info, "tuner-display-info", tuner_dev_info->tuner_display_info);
           ^~~~~~~~~~~~~~~~~~~~~~
           log_tuner_dev_info
cec-log.cpp:167:12: error: ‘arg_ana_bcast_type’ was not declared in this scope
   log_arg(&arg_ana_bcast_type, "ana-bcast-type", tuner_dev_info->analog.ana_bcast_type);
            ^~~~~~~~~~~~~~~~~~
cec-log.cpp:167:12: note: suggested alternative: ‘arg_rec_src_type’
   log_arg(&arg_ana_bcast_type, "ana-bcast-type", tuner_dev_info->analog.ana_bcast_type);
            ^~~~~~~~~~~~~~~~~~
            arg_rec_src_type
cec-log.cpp:169:12: error: ‘arg_bcast_system’ was not declared in this scope
   log_arg(&arg_bcast_system, "bcast-system", tuner_dev_info->analog.bcast_system);
            ^~~~~~~~~~~~~~~~
cec-log.cpp: In function ‘void log_ui_command(const char*, const cec_op_ui_command*)’:
cec-log.cpp:186:11: error: ‘arg_ui_cmd’ was not declared in this scope
  log_arg(&arg_ui_cmd, arg_name, ui_cmd->ui_cmd);
           ^~~~~~~~~~
cec-log.cpp:186:11: note: suggested alternative: ‘ui_cmd’
  log_arg(&arg_ui_cmd, arg_name, ui_cmd->ui_cmd);
           ^~~~~~~~~~
           ui_cmd
cec-log.cpp:191:12: error: ‘arg_ui_bcast_type’ was not declared in this scope
   log_arg(&arg_ui_bcast_type, "ui-broadcast-type",
            ^~~~~~~~~~~~~~~~~
cec-log.cpp:191:12: note: suggested alternative: ‘arg_rec_src_type’
   log_arg(&arg_ui_bcast_type, "ui-broadcast-type",
            ^~~~~~~~~~~~~~~~~
            arg_rec_src_type
cec-log.cpp:195:12: error: ‘arg_ui_snd_pres_ctl’ was not declared in this scope
   log_arg(&arg_ui_snd_pres_ctl, "ui-sound-presentation-control",
            ^~~~~~~~~~~~~~~~~~~
cec-log.cpp:202:12: error: ‘arg_channel_number_fmt’ was not declared in this scope
   log_arg(&arg_channel_number_fmt, "channel-number-fmt",
            ^~~~~~~~~~~~~~~~~~~~~~
cec-log.cpp: In function ‘void log_htng_unknown_msg(const cec_msg*)’:
cec-log.cpp:241:11: error: ‘arg_vendor_id’ was not declared in this scope
  log_arg(&arg_vendor_id, "vendor-id", vendor_id);
           ^~~~~~~~~~~~~
cec-log.cpp:241:11: note: suggested alternative: ‘vendor_id’
  log_arg(&arg_vendor_id, "vendor-id", vendor_id);
           ^~~~~~~~~~~~~
           vendor_id
cec-log.cpp: In function ‘void log_unknown_msg(const cec_msg*)’:
cec-log.cpp:270:4: error: ‘log_htng_msg’ was not declared in this scope
    log_htng_msg(msg);
    ^~~~~~~~~~~~
cec-log.cpp:270:4: note: suggested alternative: ‘cec_log_htng_msg’
    log_htng_msg(msg);
    ^~~~~~~~~~~~
    cec_log_htng_msg
cec-log.cpp:275:13: error: ‘arg_vendor_id’ was not declared in this scope
    log_arg(&arg_vendor_id, "vendor-id", vendor_id);
             ^~~~~~~~~~~~~
cec-log.cpp:275:13: note: suggested alternative: ‘vendor_id’
    log_arg(&arg_vendor_id, "vendor-id", vendor_id);
             ^~~~~~~~~~~~~
             vendor_id
cec-log.cpp: In function ‘const char* cec_log_ui_cmd_string(__u8)’:
cec-log.cpp:314:27: error: ‘arg_ui_cmd’ was not declared in this scope
  for (unsigned i = 0; i < arg_ui_cmd.num_enum_values; i++) {
                           ^~~~~~~~~~
cec-log.cpp:314:27: note: suggested alternative: ‘ui_cmd’
  for (unsigned i = 0; i < arg_ui_cmd.num_enum_values; i++) {
                           ^~~~~~~~~~
                           ui_cmd
cec-log.cpp:315:7: error: ‘type_ui_cmd’ was not declared in this scope
   if (type_ui_cmd[i].value == ui_cmd)
       ^~~~~~~~~~~
cec-log.cpp:315:7: note: suggested alternative: ‘ui_cmd’
   if (type_ui_cmd[i].value == ui_cmd)
       ^~~~~~~~~~~
       ui_cmd
cec-log.cpp: At global scope:
cec-log.cpp:248:13: warning: ‘void log_unknown_msg(const cec_msg*)’ defined but not used [-Wunused-function]
 static void log_unknown_msg(const struct cec_msg *msg)
             ^~~~~~~~~~~~~~~
cec-log.cpp:231:13: warning: ‘void log_htng_unknown_msg(const cec_msg*)’ defined but not used [-Wunused-function]
 static void log_htng_unknown_msg(const struct cec_msg *msg)
             ^~~~~~~~~~~~~~~~~~~~
cec-log.cpp:225:13: warning: ‘void log_u8_array(const char*, unsigned int, const __u8*)’ defined but not used [-Wunused-function]
 static void log_u8_array(const char *arg_name, unsigned num, const __u8 *vals)
             ^~~~~~~~~~~~
cec-log.cpp:219:13: warning: ‘void log_descriptors(const char*, unsigned int, const __u32*)’ defined but not used [-Wunused-function]
 static void log_descriptors(const char *arg_name, unsigned num, const __u32 *descriptors)
             ^~~~~~~~~~~~~~~
cec-log.cpp:183:13: warning: ‘void log_ui_command(const char*, const cec_op_ui_command*)’ defined but not used [-Wunused-function]
 static void log_ui_command(const char *arg_name,
             ^~~~~~~~~~~~~~
cec-log.cpp:175:13: warning: ‘void log_features(const cec_arg*, const char*, const __u8*)’ defined but not used [-Wunused-function]
 static void log_features(const struct cec_arg *arg,
             ^~~~~~~~~~~~
cec-log.cpp:162:13: warning: ‘void log_tuner_dev_info(const char*, const cec_op_tuner_device_info*)’ defined but not used [-Wunused-function]
 static void log_tuner_dev_info(const char *arg_name, const struct cec_op_tuner_device_info *tuner_dev_info)
             ^~~~~~~~~~~~~~~~~~
cec-log.cpp:138:13: warning: ‘void log_rec_src(const char*, const cec_op_record_src*)’ defined but not used [-Wunused-function]
 static void log_rec_src(const char *arg_name, const struct cec_op_record_src *rec_src)
             ^~~~~~~~~~~
cec-log.cpp:67:13: warning: ‘void log_arg(const cec_arg*, const char*, const char*)’ defined but not used [-Wunused-function]
 static void log_arg(const struct cec_arg *arg, const char *arg_name,
             ^~~~~~~
make[3]: *** [Makefile:541: libcecutil_la-cec-log.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
cec-info.cpp: In function ‘const char* cec_opcode2s(unsigned int)’:
cec-info.cpp:21:34: error: ‘msgtable’ was not declared in this scope
  for (unsigned i = 0; i < sizeof(msgtable) / sizeof(msgtable[0]); i++)
                                  ^~~~~~~~
cec-info.cpp:21:34: note: suggested alternative: ‘mutable’
  for (unsigned i = 0; i < sizeof(msgtable) / sizeof(msgtable[0]); i++)
                                  ^~~~~~~~
                                  mutable
cec-info.cpp: In function ‘const char* cec_cdc_opcode2s(unsigned int)’:
cec-info.cpp:29:34: error: ‘cdcmsgtable’ was not declared in this scope
  for (unsigned i = 0; i < sizeof(cdcmsgtable) / sizeof(cdcmsgtable[0]); i++)
                                  ^~~~~~~~~~~
cec-info.cpp:29:34: note: suggested alternative: ‘mutable’
  for (unsigned i = 0; i < sizeof(cdcmsgtable) / sizeof(cdcmsgtable[0]); i++)
                                  ^~~~~~~~~~~
                                  mutable
cec-info.cpp: In function ‘const char* cec_htng_opcode2s(unsigned int)’:
cec-info.cpp:37:34: error: ‘htngmsgtable’ was not declared in this scope
  for (unsigned i = 0; i < sizeof(htngmsgtable) / sizeof(htngmsgtable[0]); i++)
                                  ^~~~~~~~~~~~
cec-info.cpp:37:34: note: suggested alternative: ‘mutable’
  for (unsigned i = 0; i < sizeof(htngmsgtable) / sizeof(htngmsgtable[0]); i++)
                                  ^~~~~~~~~~~~
                                  mutable
make[3]: *** [Makefile:534: libcecutil_la-cec-info.lo] Error 1
cec-parse.cpp:207:17: warning: ‘unsigned int parse_latency(const char*)’ defined but not used [-Wunused-function]
 static unsigned parse_latency(const char *value)
                 ^~~~~~~~~~~~~
cec-parse.cpp:179:17: warning: ‘unsigned int parse_enum(const char*, const cec_arg*)’ defined but not used [-Wunused-function]
 static unsigned parse_enum(const char *value, const struct cec_arg *a)
                 ^~~~~~~~~~
cec-parse.cpp:149:14: warning: ‘__u8* args2short_aud_fmt_codes(__u8, __u8, __u8, __u8)’ defined but not used [-Wunused-function]
 static __u8 *args2short_aud_fmt_codes(__u8 audio_format_code1,
              ^~~~~~~~~~~~~~~~~~~~~~~~
cec-parse.cpp:135:14: warning: ‘__u8* args2short_aud_fmt_ids(__u8, __u8, __u8, __u8)’ defined but not used [-Wunused-function]
 static __u8 *args2short_aud_fmt_ids(__u8 audio_format_id1,
              ^~~~~~~~~~~~~~~~~~~~~~
cec-parse.cpp:121:15: warning: ‘__u32* args2short_descrs(__u32, __u32, __u32, __u32)’ defined but not used [-Wunused-function]
 static __u32 *args2short_descrs(__u32 descriptor1,
               ^~~~~~~~~~~~~~~~~
cec-parse.cpp:72:34: warning: ‘cec_op_ui_command* args2ui_command(__u8, __u8, __u8, __u8, __u8, __u8, __u8, __u8, __u8, __u16, __u16)’ defined but not used [-Wunused-function]
 static struct cec_op_ui_command *args2ui_command(__u8 ui_cmd,
                                  ^~~~~~~~~~~~~~~
cec-parse.cpp:35:42: warning: ‘cec_op_digital_service_id* args2digital_service_id(__u8, __u8, __u16, __u16, __u16, __u16, __u8, __u16, __u16)’ defined but not used [-Wunused-function]
 static struct cec_op_digital_service_id *args2digital_service_id(__u8 service_id_method,
                                          ^~~~~~~~~~~~~~~~~~~~~~~
make[3]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils/libcecutil'>
make[2]: *** [Makefile:481: all-recursive] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/utils'>
make[1]: *** [Makefile:590: all-recursive] Error 1
make[1]: Leaving directory '<https://builder.linuxtv.org/job/v4l-utils/ws/'>
make: *** [Makefile:517: all] Error 2
Build step 'Execute shell' marked build as failure
